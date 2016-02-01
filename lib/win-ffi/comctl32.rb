require 'win-ffi'
require 'win-ffi/lib_base'

module WinFFI
  module Comctl32
    extend WinFFI::LibBase

    ffi_lib 'comctl32'

    typedef :pointer, :himagelist
    typedef :pointer, :hpen
    typedef :pointer, :hkey

    #define PROGRESS_CLASSA         "msctls_progress32"
    #define PROGRESS_CLASSW         L"msctls_progress32"
    PROGRESS_CLASS = WinFFI.encoding == 'A' ? 'msctls_progress32' : 'msctls_progress32'.encode('utf-16LE')
    TOOLBAR_CLASS  = WinFFI.encoding == 'A' ? 'ToolbarWindow32' : 'ToolbarWindow32'.encode('utf-16LE')

    #if (NTDDI_VERSION >= NTDDI_WINXP)
    #define COMCTL32_VERSION  6
    #else
    #define COMCTL32_VERSION  5
    #endif
    COMCTL32_VERSION = WindowsVersion >= :xp ? 6 : 5


  end
end