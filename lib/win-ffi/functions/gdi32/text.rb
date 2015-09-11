require 'win-ffi/functions/gdi32'

require 'win-ffi/structs/gdi32/abc'
require 'win-ffi/structs/gdi32/abcfloat'
require 'win-ffi/structs/gdi32/kerning_pair'

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
      attach_function 'AddFontResourceA', [:string], :int
      attach_function 'AddFontResourceW', [:string], :int

      #int AddFontResourceEx(
      #  _In_  LPCTSTR lpszFilename,
      #  _In_  DWORD fl,
      #  _In_  PVOID pdv )
      attach_function 'AddFontResourceExA', [:string, :dword, :pointer], :int
      attach_function 'AddFontResourceExW', [:string, :dword, :pointer], :int

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
      attach_function 'CreateFontA', [:int, :int, :int, :int, :int, :uint, :uint, :uint, :uint, :uint, :uint, :uint, :uint, :string], :pointer
      attach_function 'CreateFontW', [:int, :int, :int, :int, :int, :uint, :uint, :uint, :uint, :uint, :uint, :uint, :uint, :string], :pointer

      #HFONT CreateFontIndirect( _In_  const LOGFONT *lplf )
      attach_function 'CreateFontIndirectA', [:pointer], :hfont
      attach_function 'CreateFontIndirectW', [:pointer], :hfont

      #HFONT CreateFontIndirectEx( _In_  const ENUMLOGFONTEXDV *penumlfex )
      attach_function 'CreateFontIndirectExA', [:pointer], :hfont
      attach_function 'CreateFontIndirectExW', [:pointer], :hfont

      #BOOL CreateScalableFontResource(
      #  _In_  DWORD fdwHidden,
      #  _In_  LPCTSTR lpszFontRes,
      #  _In_  LPCTSTR lpszFontFile,
      #  _In_  LPCTSTR lpszCurrentPath )
      attach_function 'CreateScalableFontResourceA', [:dword, :string, :string, :string], :bool
      attach_function 'CreateScalableFontResourceW', [:dword, :string, :string, :string], :bool

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
      attach_function 'EnumFontFamiliesA', [:hdc, :string, :pointer, :lparam], :int
      attach_function 'EnumFontFamiliesW', [:hdc, :string, :pointer, :lparam], :int

      #int EnumFontFamiliesEx(
      #  _In_  HDC hdc,
      #  _In_  LPLOGFONT lpLogfont,
      #  _In_  FONTENUMPROC lpEnumFontFamExProc,
      #  _In_  LPARAM lParam,
      #  DWORD dwFlags )
      attach_function 'EnumFontFamiliesExA', [:hdc, :pointer, :pointer, :lparam, :dword], :int
      attach_function 'EnumFontFamiliesExW', [:hdc, :pointer, :pointer, :lparam, :dword], :int

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
      attach_function 'EnumFontsA', [:hdc, :string, :pointer, :lparam], :int
      attach_function 'EnumFontsW', [:hdc, :string, :pointer, :lparam], :int

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
      attach_function 'ExtTextOutA', [:hdc, :int, :int, :uint, RECT.ptr, :string, :uint, :pointer], :bool
      attach_function 'ExtTextOutW', [:hdc, :int, :int, :uint, RECT.ptr, :string, :uint, :pointer], :bool

      #BOOL GetAspectRatioFilterEx(
      #  _In_   HDC hdc,
      #  _Out_  LPSIZE lpAspectRatio )
      attach_function 'GetAspectRatioFilterEx', [:hdc, SIZE.ptr], :bool

      #BOOL GetCharABCWidths(
      #  _In_   HDC hdc,
      #  _In_   UINT uFirstChar,
      #  _In_   UINT uLastChar,
      #  _Out_  LPABC lpabc )
      attach_function 'GetCharABCWidthsA', [:hdc, :uint, :uint, ABC.ptr], :bool
      attach_function 'GetCharABCWidthsW', [:hdc, :uint, :uint, ABC.ptr], :bool

      #BOOL GetCharABCWidthsFloat(
      #  _In_   HDC hdc,
      #  _In_   UINT iFirstChar,
      #  _In_   UINT iLastChar,
      #  _Out_  LPABCFLOAT lpABCF )
      attach_function 'GetCharABCWidthsFloatA', [:hdc, :uint, :uint, ABCFLOAT.ptr], :bool
      attach_function 'GetCharABCWidthsFloatW', [:hdc, :uint, :uint, ABCFLOAT.ptr], :bool

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
      attach_function 'GetCharacterPlacementA', [:hdc, :string, :int, :int, :pointer, :dword], :dword
      attach_function 'GetCharacterPlacementW', [:hdc, :string, :int, :int, :pointer, :dword], :dword

      #BOOL GetCharWidth32(
      #  _In_   HDC hdc,
      #  _In_   UINT iFirstChar,
      #  _In_   UINT iLastChar,
      #  _Out_  LPINT lpBuffer )
      attach_function 'GetCharWidth32A', [:hdc, :uint, :uint, :pointer], :bool
      attach_function 'GetCharWidth32W', [:hdc, :uint, :uint, :pointer], :bool

      #BOOL GetCharWidth(
      #  _In_   HDC hdc,
      #  _In_   UINT iFirstChar,
      #  _In_   UINT iLastChar,
      #  _Out_  LPINT lpBuffer )
      attach_function 'GetCharWidthA', [:hdc, :uint, :uint, :pointer], :bool
      attach_function 'GetCharWidthW', [:hdc, :uint, :uint, :pointer], :bool

      #BOOL GetCharWidthFloat(
      #  _In_   HDC hdc,
      #  _In_   UINT iFirstChar,
      #  _In_   UINT iLastChar,
      #  _Out_  PFLOAT pxBuffer )
      attach_function 'GetCharWidthFloatA', [:hdc, :uint, :uint, :pointer], :bool
      attach_function 'GetCharWidthFloatW', [:hdc, :uint, :uint, :pointer], :bool

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
      attach_function 'GetGlyphIndicesA', [:hdc, :string, :int, :pointer, :dword], :dword
      attach_function 'GetGlyphIndicesW', [:hdc, :string, :int, :pointer, :dword], :dword


      #DWORD GetGlyphOutline(
      #  _In_   HDC hdc,
      #  _In_   UINT uChar,
      #  _In_   UINT uFormat,
      #  _Out_  LPGLYPHMETRICS lpgm,
      #  _In_   DWORD cbBuffer,
      #  _Out_  LPVOID lpvBuffer,
      #  _In_   const MAT2 *lpmat2 )
      attach_function 'GetGlyphOutline', [:hdc, :uint, :uint, :pointer, :dword, :pointer, :pointer], :dword
      attach_function 'GetGlyphOutlineA', [:hdc, :uint, :uint, :pointer, :dword, :pointer, :pointer], :dword
      attach_function 'GetGlyphOutlineW', [:hdc, :uint, :uint, :pointer, :dword, :pointer, :pointer], :dword

      #DWORD GetKerningPairs(
      #  _In_   HDC hdc,
      #  _In_   DWORD nNumPairs,
      #  _Out_  LPKERNINGPAIR lpkrnpair )
      attach_function 'GetKerningPairs', [:hdc, :dword, KERNINGPAIR.ptr], :dword
      attach_function 'GetKerningPairsA', [:hdc, :dword, KERNINGPAIR.ptr], :dword
      attach_function 'GetKerningPairsW', [:hdc, :dword, KERNINGPAIR.ptr], :dword

      #UINT GetOutlineTextMetrics(
      #  _In_       HDC hdc,
      #  _In_       UINT cbData,
      #  _Out_opt_  LPOUTLINETEXTMETRIC lpOTM )
      attach_function 'GetOutlineTextMetricsA', [:hdc, :uint, :pointer], :uint
      attach_function 'GetOutlineTextMetricsW', [:hdc, :uint, :pointer], :uint

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
      attach_function 'GetTextExtentExPointA', [:hdc, :string, :int, :int, :pointer, :pointer, SIZE.ptr], :bool
      attach_function 'GetTextExtentExPointW', [:hdc, :string, :int, :int, :pointer, :pointer, SIZE.ptr], :bool

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
      attach_function 'GetTextExtentPoint32A', [:hdc, :string, :int, SIZE.ptr], :bool
      attach_function 'GetTextExtentPoint32W', [:hdc, :string, :int, SIZE.ptr], :bool

      #BOOL GetTextExtentPoint(
      #  _In_   HDC hdc,
      #  _In_   LPCTSTR lpString,
      #  _In_   int cbString,
      #  _Out_  LPSIZE lpSize )
      attach_function 'GetTextExtentPointA', [:hdc, :string, :int, SIZE.ptr], :bool
      attach_function 'GetTextExtentPointW', [:hdc, :string, :int, SIZE.ptr], :bool

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
      attach_function 'GetTextFaceA', [:hdc, :int, :string], :int
      attach_function 'GetTextFaceW', [:hdc, :int, :string], :int

      #BOOL GetTextMetrics(
      #  _In_   HDC hdc,
      #  _Out_  LPTEXTMETRIC lptm )
      attach_function 'GetTextMetricsA', [:hdc, :pointer], :bool
      attach_function 'GetTextMetricsW', [:hdc, :pointer], :bool

      #BOOL PolyTextOut(
      #  _In_  HDC hdc,
      #  _In_  const POLYTEXT *pptxt,
      #  _In_  int cStrings )
      attach_function 'PolyTextOutA', [:hdc, :pointer, :int], :bool
      attach_function 'PolyTextOutW', [:hdc, :pointer, :int], :bool

      #BOOL RemoveFontMemResourceEx( _In_  HANDLE fh )
      attach_function 'RemoveFontMemResourceEx', [:handle], :bool

      #BOOL RemoveFontResource( _In_  LPCTSTR lpFileName )
      attach_function 'RemoveFontResourceA', [:string], :bool
      attach_function 'RemoveFontResourceW', [:string], :bool

      #BOOL RemoveFontResourceEx(
      #  _In_  LPCTSTR lpFileName,
      #  _In_  DWORD fl,
      #  _In_  PVOID pdv )
      attach_function 'RemoveFontResourceExA', [:string, :dword, :pointer], :bool
      attach_function 'RemoveFontResourceExW', [:string, :dword, :pointer], :bool

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
      attach_function 'TextOutA', [:hdc, :int, :int, :string, :int], :bool
      attach_function 'TextOutW', [:hdc, :int, :int, :string, :int], :bool
  end
end