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

  require 'win-ffi/functions/netapi32/network_management'
  require 'win-ffi/structs/netapi32/wksta_info_100'

  FFI::MemoryPointer.new(:long) do |pinfoRawData|
    if Netapi32.NetWkstaGetInfo(nil, 100, pinfoRawData) == 0
      net_info = WKSTA_INFO_100.new(pinfoRawData.get_pointer(0))
      major = net_info.wki100_ver_major
      minor = net_info.wki100_ver_minor
      WindowsVersion.major = major
      WindowsVersion.minor = minor
    end
  end

  puts "WinFFI #{WinFFI::VERSION}"
  puts WinFFI::WindowsVersion.to_s
end
