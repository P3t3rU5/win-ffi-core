require 'win-ffi/functions/kernel32'

module WinFFI
  module Kernel32
    #Warning  Do not use. Consider using StringCchCat instead.
    #LPTSTR WINAPI lstrcat(
    #  _Inout_  LPTSTR lpString1,
    #  _In_     LPTSTR lpString2 )
    attach_function 'lstrcatA', [:string, :string], :pointer
    attach_function 'lstrcatW', [:string, :string], :pointer

    #int WINAPI lstrcmp(
    #  _In_  LPCTSTR lpString1,
    #  _In_  LPCTSTR lpString2 )
    attach_function 'lstrcmp', [:string, :string], :int

    #int WINAPI lstrcmpi(
    #  _In_  LPCTSTR lpString1,
    #  _In_  LPCTSTR lpString2 )
    attach_function 'lstrcmpi', [:string, :string], :int

    # Warning  Do not use. Consider using StringCchCopy instead
    #LPTSTR WINAPI lstrcpy(
    #  _Out_  LPTSTR lpString1,
    #  _In_   LPTSTR lpString2 )
    attach_function 'lstrcpy', [:string, :string], :pointer

    #Warning  Do not use. Consider using StringCchCopy instead.
    #LPTSTR WINAPI lstrcpyn(
    #  _Out_  LPTSTR lpString1,
    #  _In_   LPCTSTR lpString2,
    #  _In_   int iMaxLength )
    attach_function 'lstrcpyn', [:string, :string, :int], :pointer

    #int WINAPI lstrlen( _In_  LPCTSTR lpString )
    attach_function 'lstrlen', [:string], :int
  end
end