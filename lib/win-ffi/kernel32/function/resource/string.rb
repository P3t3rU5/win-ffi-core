require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647487(v=vs.85).aspx
    # Warning  Do not use. Consider using StringCchCat instead.
    # LPTSTR WINAPI lstrcat(
    #   _Inout_  LPTSTR lpString1,
    #   _In_     LPTSTR lpString2 )
    encoded_function 'lstrcat', [:string, :string], :pointer

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647488(v=vs.85).aspx
    # int WINAPI lstrcmp(
    #   _In_  LPCTSTR lpString1,
    #   _In_  LPCTSTR lpString2 )
    attach_function 'lstrcmp', [:string, :string], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647489(v=vs.85).aspx
    # int WINAPI lstrcmpi(
    #   _In_  LPCTSTR lpString1,
    #   _In_  LPCTSTR lpString2 )
    attach_function 'lstrcmpi', [:string, :string], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647490(v=vs.85).aspx
    # Warning  Do not use. Consider using StringCchCopy instead
    # LPTSTR WINAPI lstrcpy(
    #   _Out_  LPTSTR lpString1,
    #   _In_   LPTSTR lpString2 )
    attach_function 'lstrcpy', [:string, :string], :pointer

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647491(v=vs.85).aspx
    # Warning  Do not use. Consider using StringCchCopy instead.
    # LPTSTR WINAPI lstrcpyn(
    #   _Out_  LPTSTR lpString1,
    #   _In_   LPCTSTR lpString2,
    #   _In_   int iMaxLength )
    attach_function 'lstrcpyn', [:string, :string, :int], :pointer

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647492(v=vs.85).aspx
    # int WINAPI lstrlen( _In_  LPCTSTR lpString )
    attach_function 'lstrlen', [:string], :int
  end
end