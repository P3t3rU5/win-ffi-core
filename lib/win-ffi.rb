require 'facets/pathname'
require_relative 'win-ffi/version'
require_relative 'win-ffi/struct'

module WinFFI
  require_relative 'win-ffi/lib_base'
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

  puts "WinFFI #{WinFFI::VERSION}"
  puts WinFFI::WindowsVersion

  require_relative 'win-ffi/functions/kernel32'
  require_relative 'win-ffi/functions/gdi32'
  require_relative 'win-ffi/functions/user32'
  require_relative 'win-ffi/functions/comctl32'
end
