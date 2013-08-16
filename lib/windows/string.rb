module WinFFI
  module String
    extend LibBase

    ffi_lib 'kernel32'

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

    ffi_lib 'user32'

    #LPTSTR WINAPI CharLower(  _Inout_  LPTSTR lpsz )
    attach_function 'CharLowerA', [:string], :string
    attach_function 'CharLowerW', [:string], :string

    #DWORD WINAPI CharLowerBuff(
    #  _Inout_  LPTSTR lpsz,
    #  _In_     DWORD cchLength )
    attach_function 'CharLowerBuffA', [:string, :dword], :dword
    attach_function 'CharLowerBuffW', [:string, :dword], :dword

    #LPTSTR WINAPI CharNext( _In_  LPCTSTR lpsz )
    attach_function 'CharNextA', [:string], :string
    attach_function 'CharNextW', [:string], :string

    #LPSTR WINAPI CharNextExA(
    #  _In_  WORD CodePage,
    #  _In_  LPCSTR lpCurrentChar,
    #  _In_  DWORD dwFlags )
    attach_function 'CharNextExA', [:ushort, :string, :dword], :string

    #LPTSTR WINAPI CharPrev(
    #  _In_  LPCTSTR lpszStart,
    #  _In_  LPCTSTR lpszCurrent )
    attach_function 'CharPrevA', [:string, :string], :string
    attach_function 'CharPrevW', [:string, :string], :string

    #LPSTR WINAPI CharPrevExA(
    #  _In_  WORD CodePage,
    #  _In_  LPCSTR lpStart,
    #  _In_  LPCSTR lpCurrentChar,
    #  _In_  DWORD dwFlags )
    attach_function 'CharPrevExA', [:word, :string, :string, :dword], :string

    #BOOL WINAPI CharToOem(
    #  _In_   LPCTSTR lpszSrc,
    #  _Out_  LPSTR lpszDst )
    attach_function 'CharToOemA', [:string, :string], :bool
    attach_function 'CharToOemW', [:string, :string], :bool

    #BOOL WINAPI CharToOemBuff(
    #  _In_   LPCTSTR lpszSrc,
    #  _Out_  LPSTR lpszDst,
    #  _In_   DWORD cchDstLength )
    attach_function 'CharToOemBuffA', [:string, :string, :dword], :bool
    attach_function 'CharToOemBuffW', [:string, :string, :dword], :bool

    #LPTSTR WINAPI CharUpper( _Inout_  LPTSTR lpsz )
    attach_function 'CharUpperA', [:string], :string
    attach_function 'CharUpperW', [:string], :string

    #DWORD WINAPI CharUpperBuff(
    #  _Inout_  LPTSTR lpsz,
    #  _In_     DWORD cchLength )
    attach_function 'CharUpperBuffA', [:string, :dword], :dword
    attach_function 'CharUpperBuffW', [:string, :dword], :dword

    #BOOL WINAPI IsCharAlpha( _In_  TCHAR ch )
    attach_function 'IsCharAlphaA', [:char], :bool
    attach_function 'IsCharAlphaW', [:char], :bool

    #BOOL WINAPI IsCharAlphaNumeric( _In_  TCHAR ch )
    attach_function 'IsCharAlphaNumericA', [:char], :bool
    attach_function 'IsCharAlphaNumericW', [:char], :bool

    #BOOL WINAPI IsCharLower( _In_  TCHAR ch )
    attach_function 'IsCharLowerA', [:char], :bool
    attach_function 'IsCharLowerW', [:char], :bool

    #BOOL WINAPI IsCharUpper( _In_  TCHAR ch )
    attach_function 'IsCharUpperA', [:char], :bool
    attach_function 'IsCharUpperW', [:char], :bool

    #int WINAPI LoadString(
    #  _In_opt_  HINSTANCE hInstance,
    #  _In_      UINT uID,
    #  _Out_     LPTSTR lpBuffer,
    #  _In_      int nBufferMax )
    attach_function 'LoadStringA', [:hinstance, :uint, :string, :int], :int
    attach_function 'LoadStringW', [:hinstance, :uint, :string, :int], :int

    #BOOL WINAPI OemToChar(
    #  _In_   LPCSTR lpszSrc,
    #  _Out_  LPTSTR lpszDst )
    attach_function 'OemToCharA', [:string, :string], :bool
    attach_function 'OemToCharW', [:string, :string], :bool

    #BOOL WINAPI OemToCharBuff(
    #  _In_   LPCSTR lpszSrc,
    #  _Out_  LPTSTR lpszDst,
    #  _In_   DWORD cchDstLength )
    attach_function 'OemToCharBuffA', [:string, :string, :dword], :bool
    attach_function 'OemToCharBuffW', [:string, :string, :dword], :bool

  end
end
