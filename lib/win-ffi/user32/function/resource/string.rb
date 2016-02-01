require 'win-ffi/user32'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647467(v=vs.85).aspx
    # LPTSTR WINAPI CharLower(  _Inout_  LPTSTR lpsz )
    encoded_function 'CharLower', [:string], :string

    # CharLowerBuff
    # DWORD WINAPI CharLowerBuff(
    #   _Inout_  LPTSTR lpsz,
    #   _In_     DWORD cchLength )
    encoded_function 'CharLowerBuff', [:string, :dword], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647469(v=vs.85).aspx
    # LPTSTR WINAPI CharNext( _In_  LPCTSTR lpsz )
    encoded_function 'CharNext', [:string], :string

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647471(v=vs.85).aspx
    # LPTSTR WINAPI CharPrev(
    #   _In_  LPCTSTR lpszStart,
    #   _In_  LPCTSTR lpszCurrent )
    encoded_function 'CharPrev', [:string, :string], :string

    if WinFFI.encoding == 'A'
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647469(v=vs.85).aspx
      # LPSTR WINAPI CharNextExA(
      #   _In_  WORD CodePage,
      #   _In_  LPCSTR lpCurrentChar,
      #   _In_  DWORD dwFlags )
      attach_function 'CharNextExA', [:ushort, :string, :dword], :string

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647472(v=vs.85).aspx
      # LPSTR WINAPI CharPrevExA(
      #   _In_  WORD CodePage,
      #   _In_  LPCSTR lpStart,
      #   _In_  LPCSTR lpCurrentChar,
      #   _In_  DWORD dwFlags )
      attach_function 'CharPrevExA', [:word, :string, :string, :dword], :string
    end

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647473(v=vs.85).aspx
    # BOOL WINAPI CharToOem(
    #   _In_   LPCTSTR lpszSrc,
    #   _Out_  LPSTR lpszDst )
    encoded_function 'CharToOem', [:string, :string], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd319646(v=vs.85).aspx
    # BOOL WINAPI CharToOemBuff(
    #   _In_   LPCTSTR lpszSrc,
    #   _Out_  LPSTR lpszDst,
    #   _In_   DWORD cchDstLength )
    encoded_function 'CharToOemBuff', [:string, :string, :dword], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647474(v=vs.85).aspx
    # LPTSTR WINAPI CharUpper( _Inout_  LPTSTR lpsz )
    encoded_function 'CharUpper', [:string], :string

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647475(v=vs.85).aspx
    # DWORD WINAPI CharUpperBuff(
    #   _Inout_  LPTSTR lpsz,
    #   _In_     DWORD cchLength )
    encoded_function 'CharUpperBuff', [:string, :dword], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647482(v=vs.85).aspx
    # BOOL WINAPI IsCharAlpha( _In_  TCHAR ch )
    encoded_function 'IsCharAlpha', [:char], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647483(v=vs.85).aspx
    # BOOL WINAPI IsCharAlphaNumeric( _In_  TCHAR ch )
    encoded_function 'IsCharAlphaNumeric', [:char], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647484(v=vs.85).aspx
    # BOOL WINAPI IsCharLower( _In_  TCHAR ch )
    encoded_function 'IsCharLower', [:char], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647485(v=vs.85).aspx
    # BOOL WINAPI IsCharUpper( _In_  TCHAR ch )
    encoded_function 'IsCharUpper', [:char], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647486(v=vs.85).aspx
    # int WINAPI LoadString(
    #   _In_opt_  HINSTANCE hInstance,
    #   _In_      UINT uID,
    #   _Out_     LPTSTR lpBuffer,
    #   _In_      int nBufferMax )
    encoded_function 'LoadString', [:hinstance, :uint, :string, :int], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647493(v=vs.85).aspx
    # Do not use. Using this function incorrectly can compromise the security of your application.
    # BOOL WINAPI OemToChar(
    #   _In_   LPCSTR lpszSrc,
    #   _Out_  LPTSTR lpszDst )
    encoded_function 'OemToChar', [:string, :string], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647494(v=vs.85).aspx
    # BOOL WINAPI OemToCharBuff(
    #   _In_   LPCSTR lpszSrc,
    #   _Out_  LPTSTR lpszDst,
    #   _In_   DWORD cchDstLength )
    encoded_function 'OemToCharBuff', [:string, :string, :dword], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647550(v=vs.85).aspx
    # https://github.com/ffi/ffi/wiki/Examples#using-varargs
    # int __cdecl wsprintf(
    #   _Out_ LPTSTR  lpOut,
    #   _In_  LPCTSTR lpFmt,
    #   _In_          ...)
    encoded_function 'wsprintf', [:string, :string, :varargs], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647551(v=vs.85).aspx
    # int WINAPI wvsprintf(
    #   _Out_ LPTSTR  lpOutput,
    #   _In_  LPCTSTR lpFmt,
    #   _In_  va_list arglist)
    # attach_function 'wvsprintf', [:string, :string, :va_list], :int

    class << self
      # TODO StrSafe.h

      alias_method :AnsiToOem,     :CharToOem
      alias_method :AnsiToOemBuff, :CharToOemBuff
      alias_method :OemToAnsi,     :OemToChar
      alias_method :OemToAnsiBuff, :OemToCharBuff
      alias_method :AnsiLower,     :CharLower
      alias_method :AnsiLowerBuff, :CharLowerBuff
      alias_method :AnsiUpper,     :CharUpper
      alias_method :AnsiUpperBuff, :CharUpperBuff
      alias_method :AnsiNext,      :CharNext
      alias_method :AnsiPrev,      :CharPrev

      # def AnsiToOem(lpszSrc, lpszDst)
      #   CharToOem(lpszSrc, lpszDst)
      #   end
      #
      # def AnsiToOemBuff(lpszSrc, lpszDst, cchDstLength)
      #   CharToOemBuff(lpszSrc, lpszDst, cchDstLength)
      # end
      #
      # def AnsiLower(lpsz)
      #   CharUpper(lpsz)
      # end
      #
      # def AnsiLowerBuff(lpsz, cchLength)
      #   CharUpperBuff(lpsz, cchLength)
      # end
      #
      # def AnsiUpper(lpsz)
      #   CharUpper(lpsz)
      # end
      #
      # def AnsiUpperBuff(lpsz, cchLength)
      #   CharUpperBuff(lpsz, cchLength)
      # end
      #
      # def AnsiNext(lpsz)
      #   CharNext(lpsz)
      # end
      #
      # def AnsiPrev(lpszStart,lpszCurrent)
      #   CharPrev(lpszStart,lpszCurrent)
      # end
    end
  end
end
