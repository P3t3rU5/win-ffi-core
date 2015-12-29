require 'win-ffi/user32'

module WinFFI
  module User32
    #LPTSTR WINAPI CharLower(  _Inout_  LPTSTR lpsz )
    encoded_function 'CharLower', [:string], :string

    #DWORD WINAPI CharLowerBuff(
    #  _Inout_  LPTSTR lpsz,
    #  _In_     DWORD cchLength )
    encoded_function 'CharLowerBuff', [:string, :dword], :dword

    #LPTSTR WINAPI CharNext( _In_  LPCTSTR lpsz )
    encoded_function 'CharNext', [:string], :string

    #LPTSTR WINAPI CharPrev(
    #  _In_  LPCTSTR lpszStart,
    #  _In_  LPCTSTR lpszCurrent )
    encoded_function 'CharPrev', [:string, :string], :string

    if WinFFI.encoding == 'A'
      #LPSTR WINAPI CharNextExA(
      #  _In_  WORD CodePage,
      #  _In_  LPCSTR lpCurrentChar,
      #  _In_  DWORD dwFlags )
      attach_function 'CharNextExA', [:ushort, :string, :dword], :string

      #LPSTR WINAPI CharPrevExA(
      #  _In_  WORD CodePage,
      #  _In_  LPCSTR lpStart,
      #  _In_  LPCSTR lpCurrentChar,
      #  _In_  DWORD dwFlags )
      attach_function 'CharPrevExA', [:word, :string, :string, :dword], :string
    end

    #BOOL WINAPI CharToOem(
    #  _In_   LPCTSTR lpszSrc,
    #  _Out_  LPSTR lpszDst )
    encoded_function 'CharToOem', [:string, :string], :bool

    #BOOL WINAPI CharToOemBuff(
    #  _In_   LPCTSTR lpszSrc,
    #  _Out_  LPSTR lpszDst,
    #  _In_   DWORD cchDstLength )
    encoded_function 'CharToOemBuff', [:string, :string, :dword], :bool

    #LPTSTR WINAPI CharUpper( _Inout_  LPTSTR lpsz )
    encoded_function 'CharUpper', [:string], :string

    #DWORD WINAPI CharUpperBuff(
    #  _Inout_  LPTSTR lpsz,
    #  _In_     DWORD cchLength )
    encoded_function 'CharUpperBuff', [:string, :dword], :dword

    #BOOL WINAPI IsCharAlpha( _In_  TCHAR ch )
    encoded_function 'IsCharAlpha', [:char], :bool

    #BOOL WINAPI IsCharAlphaNumeric( _In_  TCHAR ch )
    encoded_function 'IsCharAlphaNumeric', [:char], :bool

    #BOOL WINAPI IsCharLower( _In_  TCHAR ch )
    encoded_function 'IsCharLower', [:char], :bool

    #BOOL WINAPI IsCharUpper( _In_  TCHAR ch )
    encoded_function 'IsCharUpper', [:char], :bool

    #int WINAPI LoadString(
    #  _In_opt_  HINSTANCE hInstance,
    #  _In_      UINT uID,
    #  _Out_     LPTSTR lpBuffer,
    #  _In_      int nBufferMax )
    encoded_function 'LoadString', [:hinstance, :uint, :string, :int], :int

    #BOOL WINAPI OemToChar(
    #  _In_   LPCSTR lpszSrc,
    #  _Out_  LPTSTR lpszDst )
    encoded_function 'OemToChar', [:string, :string], :bool

    #BOOL WINAPI OemToCharBuff(
    #  _In_   LPCSTR lpszSrc,
    #  _Out_  LPTSTR lpszDst,
    #  _In_   DWORD cchDstLength )
    encoded_function 'OemToCharBuff', [:string, :string, :dword], :bool
  end
end
