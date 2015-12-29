require 'facets/pathname'
require 'win-ffi/version'
require 'win-ffi/struct'
require 'win-ffi/lib_base'

module WinFFI
  extend LibBase

  @encoding = __ENCODING__.name =~ /ASCII/ ? 'A' : 'W'

  def self.encoding
    @encoding
  end

  def self.encoding=(encoding)
    @encoding = encoding
  end

  module Kernel32
    extend LibBase

    ffi_lib 'kernel32'

    #BOOL WINAPI GetVersionEx( _Inout_  LPOSVERSIONINFO lpVersionInfo )
    encoded_function 'GetVersionEx', [:pointer], :bool
  end

  require 'win-ffi/kernel32/struct/os_version_info_ex'

  WindowsVersion = OSVERSIONINFOEX.new.get!

  WindowsVersion.major, WindowsVersion.minor, WindowsVersion.build = `ver`.match(/\d+\.\d+\.\d+/)[0].split('.').map(&:to_i)

  puts "WinFFI #{WinFFI::VERSION}"
  puts WindowsVersion.to_s

  puts __ENCODING__

  Architecture = 1.size * 8
end
