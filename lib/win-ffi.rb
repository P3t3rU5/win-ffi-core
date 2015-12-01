require 'facets/pathname'
require 'win-ffi/version'
require 'win-ffi/struct'


module WinFFI
  require 'win-ffi/lib_base'
  extend LibBase

  module Kernel32
    extend LibBase

    ffi_lib 'kernel32'

    #BOOL WINAPI GetVersionEx( _Inout_  LPOSVERSIONINFO lpVersionInfo )
    attach_function 'GetVersionExA', [:pointer], :bool
    attach_function 'GetVersionExW', [:pointer], :bool
  end

  require_relative 'win-ffi/structs/os_version_info_ex'

  WindowsVersion = OSVERSIONINFOEX.new.get!

  WindowsVersion.major, WindowsVersion.minor, WindowsVersion.build = `ver`.match(/\d+\.\d+\.\d+/)[0].split('.').map(&:to_i)

  puts "WinFFI #{WinFFI::VERSION}"
  puts WinFFI::WindowsVersion.to_s

  @encoding = __ENCODING__.name =~ /ASCII/ ? 'A' : 'W'

  def self.encoding
    @encoding
  end

  def self.encoding=(encoding)
    @encoding = encoding
  end
  puts __ENCODING__
end
