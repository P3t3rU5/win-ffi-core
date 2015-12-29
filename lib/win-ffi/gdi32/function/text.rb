require 'win-ffi/gdi32'

require 'win-ffi/gdi32/struct/abc'
require 'win-ffi/gdi32/struct/abcfloat'
require 'win-ffi/gdi32/struct/kerning_pair'

module WinFFI
  module Gdi32

      typedef :pointer, :hfont

      #HANDLE AddFontMemResourceEx(
      #  _In_  PVOID pbFont,
      #  _In_  DWORD cbFont,
      #  _In_  PVOID pdv,
      #  _In_  DWORD *pcFonts )
      attach_function 'AddFontMemResourceEx', [:pointer, :dword, :pointer, :pointer], :handle

      #int AddFontResource( _In_  LPCTSTR lpszFilename )
      encoded_function 'AddFontResource', [:string], :int

      #int AddFontResourceEx(
      #  _In_  LPCTSTR lpszFilename,
      #  _In_  DWORD fl,
      #  _In_  PVOID pdv )
      encoded_function 'AddFontResourceEx', [:string, :dword, :pointer], :int

      #HFONT CreateFont(
      #  __in  int nHeight,
      #  __in  int nWidth,
      #  __in  int nEscapement,
      #  __in  int nOrientation,
      #  __in  int fnWeight,
      #  __in  DWORD fdwItalic,
      #  __in  DWORD fdwUnderline,
      #  __in  DWORD fdwStrikeOut,
      #  __in  DWORD fdwCharSet,
      #  __in  DWORD fdwOutputPrecision,
      #  __in  DWORD fdwClipPrecision,
      #  __in  DWORD fdwQuality,
      #  __in  DWORD fdwPitchAndFamily,
      #  __in  LPCTSTR lpszFace)
      encoded_function 'CreateFont', [:int, :int, :int, :int, :int, :uint, :uint, :uint, :uint, :uint, :uint, :uint, :uint, :string], :hfont

      #HFONT CreateFontIndirect( _In_  const LOGFONT *lplf )
      encoded_function 'CreateFontIndirect', [:pointer], :hfont

      #HFONT CreateFontIndirectEx( _In_  const ENUMLOGFONTEXDV *penumlfex )
      encoded_function 'CreateFontIndirectEx', [:pointer], :hfont

      #BOOL CreateScalableFontResource(
      #  _In_  DWORD fdwHidden,
      #  _In_  LPCTSTR lpszFontRes,
      #  _In_  LPCTSTR lpszFontFile,
      #  _In_  LPCTSTR lpszCurrentPath )
      encoded_function 'CreateScalableFontResource', [:dword, :string, :string, :string], :bool

      #BOOL EnableEUDC( _In_  HDC BOOL fEnableEUDC )
      attach_function 'EnableEUDC', [:bool], :bool

      #TODO
      #int CALLBACK EnumFontFamExProc(
      #  const LOGFONT *lpelfe,
      #  const TEXTMETRIC *lpntme,
      #  DWORD FontType,
      #  LPARAM lParam )

      #int EnumFontFamilies(
      #  _In_  HDC hdc,
      #  _In_  LPCTSTR lpszFamily,
      #  _In_  FONTENUMPROC lpEnumFontFamProc,
      #  _In_  LPARAM lParam )
      encoded_function 'EnumFontFamilies', [:hdc, :string, :pointer, :lparam], :int

      #int EnumFontFamiliesEx(
      #  _In_  HDC hdc,
      #  _In_  LPLOGFONT lpLogfont,
      #  _In_  FONTENUMPROC lpEnumFontFamExProc,
      #  _In_  LPARAM lParam,
      #  DWORD dwFlags )
      encoded_function 'EnumFontFamiliesEx', [:hdc, :pointer, :pointer, :lparam, :dword], :int

      #TODO
      #int CALLBACK EnumFontFamProc(
      #  _In_  ENUMLOGFONT *lpelf,
      #  _In_  NEWTEXTMETRIC *lpntm,
      #  _In_  DWORD FontType,
      #  _In_  LPARAM lParam )

      #int EnumFonts(
      #  _In_  HDC hdc,
      #  _In_  LPCTSTR lpFaceName,
      #  _In_  FONTENUMPROC lpFontFunc,
      #  _In_  LPARAM lParam )
      encoded_function 'EnumFonts', [:hdc, :string, :pointer, :lparam], :int

      #TODO
      #int CALLBACK EnumFontsProc(
      #  _In_  const LOGFONT *lplf,
      #  _In_  const TEXTMETRIC *lptm,
      #  _In_  DWORD dwType,
      #  _In_  LPARAM lpData )

      #BOOL ExtTextOut(
      #  _In_  HDC hdc,
      #  _In_  int X,
      #  _In_  int Y,
      #  _In_  UINT fuOptions,
      #  _In_  const RECT *lprc,
      #  _In_  LPCTSTR lpString,
      #  _In_  UINT cbCount,
      #  _In_  const INT *lpDx )
      encoded_function 'ExtTextOut', [:hdc, :int, :int, :uint, RECT.ptr, :string, :uint, :pointer], :bool

      #BOOL GetAspectRatioFilterEx(
      #  _In_   HDC hdc,
      #  _Out_  LPSIZE lpAspectRatio )
      attach_function 'GetAspectRatioFilterEx', [:hdc, SIZE.ptr], :bool

      #BOOL GetCharABCWidths(
      #  _In_   HDC hdc,
      #  _In_   UINT uFirstChar,
      #  _In_   UINT uLastChar,
      #  _Out_  LPABC lpabc )
      encoded_function 'GetCharABCWidths', [:hdc, :uint, :uint, ABC.ptr], :bool

      #BOOL GetCharABCWidthsFloat(
      #  _In_   HDC hdc,
      #  _In_   UINT iFirstChar,
      #  _In_   UINT iLastChar,
      #  _Out_  LPABCFLOAT lpABCF )
      encoded_function 'GetCharABCWidthsFloat', [:hdc, :uint, :uint, ABCFLOAT.ptr], :bool

      #BOOL GetCharABCWidthsI(
      #  _In_   HDC hdc,
      #  _In_   UINT giFirst,
      #  _In_   UINT cgi,
      #  _In_   LPWORD pgi,
      #  _Out_  LPABC lpabc )
      attach_function 'GetCharABCWidthsI', [:hdc, :uint, :uint, :pointer, ABC.ptr], :bool

      #DWORD GetCharacterPlacement(
      #  _In_     HDC hdc,
      #  _In_     LPCTSTR lpString,
      #  _In_     int nCount,
      #  _In_     int nMaxExtent,
      #  _Inout_  LPGCP_RESULTS lpResults,
      #  _In_     DWORD dwFlags )
      encoded_function 'GetCharacterPlacement', [:hdc, :string, :int, :int, :pointer, :dword], :dword

      #BOOL GetCharWidth32(
      #  _In_   HDC hdc,
      #  _In_   UINT iFirstChar,
      #  _In_   UINT iLastChar,
      #  _Out_  LPINT lpBuffer )
      encoded_function 'GetCharWidth32', [:hdc, :uint, :uint, :pointer], :bool

      #BOOL GetCharWidth(
      #  _In_   HDC hdc,
      #  _In_   UINT iFirstChar,
      #  _In_   UINT iLastChar,
      #  _Out_  LPINT lpBuffer )
      encoded_function 'GetCharWidth', [:hdc, :uint, :uint, :pointer], :bool

      #BOOL GetCharWidthFloat(
      #  _In_   HDC hdc,
      #  _In_   UINT iFirstChar,
      #  _In_   UINT iLastChar,
      #  _Out_  PFLOAT pxBuffer )
      encoded_function 'GetCharWidthFloat', [:hdc, :uint, :uint, :pointer], :bool

      #BOOL GetCharWidthI(
      #  _In_   HDC hdc,
      #  _In_   UINT giFirst,
      #  _In_   UINT cgi,
      #  _In_   LPWORD pgi,
      #  _Out_  LPINT lpBuffer )
      attach_function 'GetCharWidthI', [:hdc, :uint, :uint, :pointer, :pointer], :bool

      #DWORD GetFontData(
      #  _In_   HDC hdc,
      #  _In_   DWORD dwTable,
      #  _In_   DWORD dwOffset,
      #  _Out_  LPVOID lpvBuffer,
      #  _In_   DWORD cbData )
      attach_function 'GetFontData', [:hdc, :dword, :dword, :pointer, :pointer], :dword

      #DWORD GetFontLanguageInfo( _In_  HDC hdc )
      attach_function 'GetFontLanguageInfo', [:hdc], :dword

      #DWORD GetFontUnicodeRanges(
      #  _In_   HDC hdc,
      #  _Out_  LPGLYPHSET lpgs )
      attach_function 'GetFontUnicodeRanges', [:hdc, :pointer], :dword

      #DWORD GetGlyphIndices(
      #  _In_   HDC hdc,
      #  _In_   LPCTSTR lpstr,
      #  _In_   int c,
      #  _Out_  LPWORD pgi,
      #  _In_   DWORD fl )
      encoded_function 'GetGlyphIndices', [:hdc, :string, :int, :pointer, :dword], :dword


      #DWORD GetGlyphOutline(
      #  _In_   HDC hdc,
      #  _In_   UINT uChar,
      #  _In_   UINT uFormat,
      #  _Out_  LPGLYPHMETRICS lpgm,
      #  _In_   DWORD cbBuffer,
      #  _Out_  LPVOID lpvBuffer,
      #  _In_   const MAT2 *lpmat2 )
      encoded_function 'GetGlyphOutline', [:hdc, :uint, :uint, :pointer, :dword, :pointer, :pointer], :dword

      #DWORD GetKerningPairs(
      #  _In_   HDC hdc,
      #  _In_   DWORD nNumPairs,
      #  _Out_  LPKERNINGPAIR lpkrnpair )
      encoded_function 'GetKerningPairs', [:hdc, :dword, KERNINGPAIR.ptr], :dword

      #UINT GetOutlineTextMetrics(
      #  _In_       HDC hdc,
      #  _In_       UINT cbData,
      #  _Out_opt_  LPOUTLINETEXTMETRIC lpOTM )
      encoded_function 'GetOutlineTextMetrics', [:hdc, :uint, :pointer], :uint

      #BOOL GetRasterizerCaps(
      #  _Out_  LPRASTERIZER_STATUS lprs,
      #  _In_   UINT cb )
      attach_function 'GetRasterizerCaps',  [:pointer, :uint], :bool

      #UINT GetTextAlign( _In_  HDC hdc )
      attach_function 'GetTextAlign', [:hdc], :uint

      #int GetTextCharacterExtra( _In_  HDC hdc )
      attach_function 'GetTextCharacterExtra', [:hdc], :int

      #COLORREF GetTextColor( _In_  HDC hdc )
      attach_function 'GetTextColor', [:hdc], :colorref

      #BOOL GetTextExtentExPoint(
      #  _In_   HDC hdc,
      #  _In_   LPCTSTR lpszStr,
      #  _In_   int cchString,
      #  _In_   int nMaxExtent,
      #  _Out_  LPINT lpnFit,
      #  _Out_  LPINT alpDx,
      #  _Out_  LPSIZE lpSize )
      encoded_function 'GetTextExtentExPoint', [:hdc, :string, :int, :int, :pointer, :pointer, SIZE.ptr], :bool

      #BOOL GetTextExtentExPointI(
      #  _In_   HDC hdc,
      #  _In_   LPWORD pgiIn,
      #  _In_   int cgi,
      #  _In_   int nMaxExtent,
      #  _Out_  LPINT lpnFit,
      #  _Out_  LPINT alpDx,
      #  _Out_  LPSIZE lpSize )
      attach_function 'GetTextExtentExPointI', [:hdc, :pointer, :int, :int, :pointer, :pointer, SIZE.ptr], :bool

      #BOOL GetTextExtentPoint32(
      #  _In_   HDC hdc,
      #  _In_   LPCTSTR lpString,
      #  _In_   int c,
      #  _Out_  LPSIZE lpSize )
      encoded_function 'GetTextExtentPoint32', [:hdc, :string, :int, SIZE.ptr], :bool

      #BOOL GetTextExtentPoint(
      #  _In_   HDC hdc,
      #  _In_   LPCTSTR lpString,
      #  _In_   int cbString,
      #  _Out_  LPSIZE lpSize )
      encoded_function 'GetTextExtentPoint', [:hdc, :string, :int, SIZE.ptr], :bool

      #BOOL GetTextExtentPointI(
      #  _In_   HDC hdc,
      #  _In_   LPWORD pgiIn,
      #  _In_   int cgi,
      #  _Out_  LPSIZE lpSize )
      attach_function 'GetTextExtentPointI', [:hdc, :pointer, :int, SIZE.ptr], :bool

      #int GetTextFace(
      #  _In_   HDC hdc,
      #  _In_   int nCount,
      #  _Out_  LPTSTR lpFaceName )
      encoded_function 'GetTextFace', [:hdc, :int, :string], :int

      #BOOL GetTextMetrics(
      #  _In_   HDC hdc,
      #  _Out_  LPTEXTMETRIC lptm )
      encoded_function 'GetTextMetrics', [:hdc, :pointer], :bool

      #BOOL PolyTextOut(
      #  _In_  HDC hdc,
      #  _In_  const POLYTEXT *pptxt,
      #  _In_  int cStrings )
      encoded_function 'PolyTextOut', [:hdc, :pointer, :int], :bool

      #BOOL RemoveFontMemResourceEx( _In_  HANDLE fh )
      attach_function 'RemoveFontMemResourceEx', [:handle], :bool

      #BOOL RemoveFontResource( _In_  LPCTSTR lpFileName )
      encoded_function 'RemoveFontResource', [:string], :bool

      #BOOL RemoveFontResourceEx(
      #  _In_  LPCTSTR lpFileName,
      #  _In_  DWORD fl,
      #  _In_  PVOID pdv )
      encoded_function 'RemoveFontResourceEx', [:string, :dword, :pointer], :bool

      #DWORD SetMapperFlags(
      #  _In_  HDC hdc,
      #  _In_  DWORD dwFlag )
      attach_function 'SetMapperFlags', [:hdc, :dword], :dword

      #UINT SetTextAlign(
      #  _In_  HDC hdc,
      #  _In_  UINT fMode )
      attach_function 'SetTextAlign', [:hdc, :uint], :uint

      #int SetTextCharacterExtra(
      #  _In_  HDC hdc,
      #  _In_  int nCharExtra )
      attach_function 'SetTextCharacterExtra', [:hdc, :int], :int

      #COLORREF SetTextColor(
      #  _In_  HDC hdc,
      #  _In_  COLORREF crColor )
      attach_function 'SetTextColor', [:hdc, :colorref], :colorref

      #BOOL SetTextJustification(
      #  _In_  HDC hdc,
      #  _In_  int nBreakExtra,
      #  _In_  int nBreakCount )
      attach_function 'SetTextJustification', [:hdc, :int, :int], :bool

      #BOOL TextOut(
      #  _In_  HDC hdc,
      #  _In_  int nXStart,
      #  _In_  int nYStart,
      #  _In_  LPCTSTR lpString,
      #  _In_  int cchString )
      encoded_function 'TextOut', [:hdc, :int, :int, :string, :int], :bool
  end
end