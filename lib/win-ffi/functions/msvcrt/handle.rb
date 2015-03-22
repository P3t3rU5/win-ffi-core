module WinFFI
  module Msvcrt
    ffi_lib 'msvcrt'

    #intptr_t _get_osfhandle( int fd )
    attach_function '_get_osfhandle', [:int], :long

    #int _open_osfhandle (
    #  intptr_t osfhandle,
    #  int flags )
    attach_function '_open_osfhandle', [:long, :int], :int
  end
end