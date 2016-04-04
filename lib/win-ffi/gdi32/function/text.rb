require 'win-ffi/gdi32'

require 'win-ffi/gdi32/enum/text/ext_text_out_flag'
require 'win-ffi/gdi32/enum/text/font/font_weight'
require 'win-ffi/gdi32/enum/text/font/font_charset'
require 'win-ffi/gdi32/enum/text/font/font_output_precision'
require 'win-ffi/gdi32/enum/text/font/font_clip_precision'
require 'win-ffi/gdi32/enum/text/font/font_quality'
require 'win-ffi/gdi32/enum/text/font/font_family_pitch'
require 'win-ffi/gdi32/enum/text/font/font_resource_flag'
require 'win-ffi/gdi32/enum/text/get_character_placement_flag'
require 'win-ffi/gdi32/enum/text/get_glyph_outline_format'
require 'win-ffi/gdi32/enum/text/text_align_flag'

require 'win-ffi/gdi32/struct/text/abc'
require 'win-ffi/gdi32/struct/text/abcfloat'
require 'win-ffi/gdi32/struct/text/enum_log_font'
require 'win-ffi/gdi32/struct/text/enum_log_font_extended_design_vector'
require 'win-ffi/gdi32/struct/text/glyph_set'
require 'win-ffi/gdi32/struct/text/glyph_metrics'
require 'win-ffi/gdi32/struct/text/gcp_results'
require 'win-ffi/gdi32/struct/text/kerning_pair'
require 'win-ffi/gdi32/struct/text/log_font'
require 'win-ffi/gdi32/struct/text/mat2'
require 'win-ffi/gdi32/struct/text/outline_text_metric'
require 'win-ffi/gdi32/struct/text/poly_text'
require 'win-ffi/gdi32/struct/text/rasterizer_status'
require 'win-ffi/gdi32/struct/text/text_metric'

module WinFFI
  module Gdi32

    typedef :pointer, :hfont

    # https://msdn.microsoft.com/en-us/library/dd183325(v=vs.85).aspx
    # HANDLE AddFontMemResourceEx(
    #   _In_  PVOID pbFont,
    #   _In_  DWORD cbFont,
    #   _In_  PVOID pdv,
    #   _In_  DWORD *pcFonts )
    attach_function 'AddFontMemResourceEx', [:pointer, :dword, :pointer, :pointer], :handle

    # https://msdn.microsoft.com/en-us/library/dd183326(v=vs.85).aspx
    # int AddFontResource( _In_  LPCTSTR lpszFilename )
    encoded_function 'AddFontResource', [:string], :int

    # https://msdn.microsoft.com/en-us/library/dd183327(v=vs.85).aspx
    # int AddFontResourceEx(
    #   _In_  LPCTSTR lpszFilename,
    #   _In_  DWORD fl,
    #   _In_  PVOID pdv )
    encoded_function 'AddFontResourceEx', [:string, FontResourceFlag, :pointer], :int

    # https://msdn.microsoft.com/en-us/library/dd183499(v=vs.85).aspx
    # HFONT CreateFont(
    #   __in  int nHeight,
    #   __in  int nWidth,
    #   __in  int nEscapement,
    #   __in  int nOrientation,
    #   __in  int fnWeight,
    #   __in  DWORD fdwItalic,
    #   __in  DWORD fdwUnderline,
    #   __in  DWORD fdwStrikeOut,
    #   __in  DWORD fdwCharSet,
    #   __in  DWORD fdwOutputPrecision,
    #   __in  DWORD fdwClipPrecision,
    #   __in  DWORD fdwQuality,
    #   __in  DWORD fdwPitchAndFamily,
    #   __in  LPCTSTR lpszFace)
    encoded_function 'CreateFont',
                     [:int, :int, :int, :int, FontWeight, :dword, :dword, :uint, FontCharset, FontOutputPrecision,
                      FontClipPrecision, FontQuality, FontFamilyPitch, :string], :hfont

    # https://msdn.microsoft.com/en-us/library/dd183500(v=vs.85).aspx
    # HFONT CreateFontIndirect( _In_  const LOGFONT *lplf )
    encoded_function 'CreateFontIndirect', [LOGFONT.ptr(:in)], :hfont

    # https://msdn.microsoft.com/en-us/library/dd183501(v=vs.85).aspx
    # HFONT CreateFontIndirectEx( _In_  const ENUMLOGFONTEXDV *penumlfex )
    encoded_function 'CreateFontIndirectEx', [ENUMLOGFONTEXDV], :hfont

    # https://msdn.microsoft.com/en-us/library/dd183517(v=vs.85).aspx
    # BOOL CreateScalableFontResource(
    #   _In_  DWORD fdwHidden,
    #   _In_  LPCTSTR lpszFontRes,
    #   _In_  LPCTSTR lpszFontFile,
    #   _In_  LPCTSTR lpszCurrentPath )
    encoded_function 'CreateScalableFontResource', [:dword, :string, :string, :string], :bool

    # https://msdn.microsoft.com/en-us/library/dd162593(v=vs.85).aspx
    # BOOL EnableEUDC( _In_  HDC BOOL fEnableEUDC )
    attach_function 'EnableEUDC', [:bool], :bool

    # https://msdn.microsoft.com/en-us/library/dd162618(v=vs.85).aspx
    # int CALLBACK EnumFontFamExProc(
    #   const LOGFONT *lpelfe,
    #   const TEXTMETRIC *lpntme,
    #   DWORD FontType,
    #   LPARAM lParam )
    EnumFontFamExProc = callback 'EnumFontFamExProc', [LOGFONT.ptr, TEXTMETRIC.ptr, :dword, :lparam], :int

    # https://msdn.microsoft.com/en-us/library/dd162621(v=vs.85).aspx
    # int CALLBACK EnumFontFamProc(
    #   _In_  ENUMLOGFONT *lpelf,
    #   _In_  NEWTEXTMETRIC *lpntm,
    #   _In_  DWORD FontType,
    #   _In_  LPARAM lParam )
    EnumFontFamProc = callback 'EnumFontFamProc', [ENUMLOGFONT.ptr(:in), TEXTMETRIC.ptr(:in), :dword, :lparam], :int

    # https://msdn.microsoft.com/en-us/library/dd162623(v=vs.85).aspx
    # int CALLBACK EnumFontsProc(
    #   _In_  const LOGFONT *lplf,
    #   _In_  const TEXTMETRIC *lptm,
    #   _In_  DWORD dwType,
    #   _In_  LPARAM lpData )
    EnumFontsProc = callback 'EnumFontsProc', [ENUMLOGFONT.ptr(:in), TEXTMETRIC.ptr(:in), :dword, :lparam], :int

    # https://msdn.microsoft.com/en-us/library/dd162619(v=vs.85).aspx
    # int EnumFontFamilies(
    #   _In_  HDC hdc,
    #   _In_  LPCTSTR lpszFamily,
    #   _In_  FONTENUMPROC lpEnumFontFamProc,
    #   _In_  LPARAM lParam )
    encoded_function 'EnumFontFamilies', [:hdc, :string, EnumFontFamProc, :lparam], :int

    # https://msdn.microsoft.com/en-us/library/dd162620(v=vs.85).aspx
    # int EnumFontFamiliesEx(
    #   _In_  HDC hdc,
    #   _In_  LPLOGFONT lpLogfont,
    #   _In_  FONTENUMPROC lpEnumFontFamExProc,
    #   _In_  LPARAM lParam,
    #   DWORD dwFlags )
    encoded_function 'EnumFontFamiliesEx', [:hdc, LOGFONT.ptr(:in), EnumFontFamExProc, :lparam, :dword], :int

    # https://msdn.microsoft.com/en-us/library/dd162622(v=vs.85).aspx
    # int EnumFonts(
    #   _In_  HDC hdc,
    #   _In_  LPCTSTR lpFaceName,
    #   _In_  FONTENUMPROC lpFontFunc,
    #   _In_  LPARAM lParam )
    encoded_function 'EnumFonts', [:hdc, :string, EnumFontsProc, :lparam], :int

    # https://msdn.microsoft.com/en-us/library/dd162713(v=vs.85).aspx
    # BOOL ExtTextOut(
    #   _In_  HDC hdc,
    #   _In_  int X,
    #   _In_  int Y,
    #   _In_  UINT fuOptions,
    #   _In_  const RECT *lprc,
    #   _In_  LPCTSTR lpString,
    #   _In_  UINT cbCount,
    #   _In_  const INT *lpDx )
    encoded_function 'ExtTextOut', [:hdc, :int, :int, ExtTextOutFlag, RECT.ptr(:in), :string, :uint, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/dd144849(v=vs.85).aspx
    # BOOL GetAspectRatioFilterEx(
    #   _In_   HDC hdc,
    #   _Out_  LPSIZE lpAspectRatio )
    attach_function 'GetAspectRatioFilterEx', [:hdc, SIZE.ptr(:out)], :bool

    # https://msdn.microsoft.com/en-us/library/dd144857(v=vs.85).aspx
    # BOOL GetCharABCWidths(
    #   _In_   HDC hdc,
    #   _In_   UINT uFirstChar,
    #   _In_   UINT uLastChar,
    #   _Out_  LPABC lpabc )
    encoded_function 'GetCharABCWidths', [:hdc, :uint, :uint, ABC.ptr(:out)], :bool

    # https://msdn.microsoft.com/en-us/library/dd144858(v=vs.85).aspx
    # BOOL GetCharABCWidthsFloat(
    #   _In_   HDC hdc,
    #   _In_   UINT iFirstChar,
    #   _In_   UINT iLastChar,
    #   _Out_  LPABCFLOAT lpABCF )
    encoded_function 'GetCharABCWidthsFloat', [:hdc, :uint, :uint, ABCFLOAT.ptr(:out)], :bool

    # https://msdn.microsoft.com/en-us/library/dd144859(v=vs.85).aspx
    # BOOL GetCharABCWidthsI(
    #   _In_   HDC hdc,
    #   _In_   UINT giFirst,
    #   _In_   UINT cgi,
    #   _In_   LPWORD pgi,
    #   _Out_  LPABC lpabc )
    attach_function 'GetCharABCWidthsI', [:hdc, :uint, :uint, :pointer, ABC.ptr(:out)], :bool

    # https://msdn.microsoft.com/en-us/library/dd144860(v=vs.85).aspx
    # DWORD GetCharacterPlacement(
    #   _In_     HDC hdc,
    #   _In_     LPCTSTR lpString,
    #   _In_     int nCount,
    #   _In_     int nMaxExtent,
    #   _Inout_  LPGCP_RESULTS lpResults,
    #   _In_     DWORD dwFlags )
    encoded_function 'GetCharacterPlacement', [:hdc, :string, :int, :int, GCP_RESULTS.ptr, GetCharacterPlacementFlag], :dword

    # https://msdn.microsoft.com/en-us/library/dd144861(v=vs.85).aspx
    # BOOL GetCharWidth(
    #   _In_   HDC hdc,
    #   _In_   UINT iFirstChar,
    #   _In_   UINT iLastChar,
    #   _Out_  LPINT lpBuffer )
    encoded_function 'GetCharWidth', [:hdc, :uint, :uint, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/dd144862(v=vs.85).aspx
    # BOOL GetCharWidth32(
    #   _In_   HDC hdc,
    #   _In_   UINT iFirstChar,
    #   _In_   UINT iLastChar,
    #   _Out_  LPINT lpBuffer )
    encoded_function 'GetCharWidth32', [:hdc, :uint, :uint, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/dd144863(v=vs.85).aspx
    # BOOL GetCharWidthFloat(
    #   _In_   HDC hdc,
    #   _In_   UINT iFirstChar,
    #   _In_   UINT iLastChar,
    #   _Out_  PFLOAT pxBuffer )
    encoded_function 'GetCharWidthFloat', [:hdc, :uint, :uint, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/dd144864(v=vs.85).aspx
    # BOOL GetCharWidthI(
    #   _In_   HDC hdc,
    #   _In_   UINT giFirst,
    #   _In_   UINT cgi,
    #   _In_   LPWORD pgi,
    #   _Out_  LPINT lpBuffer )
    attach_function 'GetCharWidthI', [:hdc, :uint, :uint, :pointer, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/dd144885(v=vs.85).aspx
    # DWORD GetFontData(
    #   _In_   HDC hdc,
    #   _In_   DWORD dwTable,
    #   _In_   DWORD dwOffset,
    #   _Out_  LPVOID lpvBuffer,
    #   _In_   DWORD cbData )
    attach_function 'GetFontData', [:hdc, :dword, :dword, :pointer, :dword], :dword

    # https://msdn.microsoft.com/en-us/library/dd144886(v=vs.85).aspx
    # DWORD GetFontLanguageInfo( _In_  HDC hdc )
    attach_function 'GetFontLanguageInfo', [:hdc], :dword

    # https://msdn.microsoft.com/en-us/library/dd144887(v=vs.85).aspx
    # DWORD GetFontUnicodeRanges(
    #   _In_   HDC hdc,
    #   _Out_  LPGLYPHSET lpgs )
    attach_function 'GetFontUnicodeRanges', [:hdc, GLYPHSET], :dword

    # https://msdn.microsoft.com/en-us/library/dd144890(v=vs.85).aspx
    # DWORD GetGlyphIndices(
    #   _In_   HDC hdc,
    #   _In_   LPCTSTR lpstr,
    #   _In_   int c,
    #   _Out_  LPWORD pgi,
    #   _In_   DWORD fl )
    encoded_function 'GetGlyphIndices', [:hdc, :string, :int, :pointer, :dword], :dword

    # https://msdn.microsoft.com/en-us/library/dd144891(v=vs.85).aspx
    # DWORD GetGlyphOutline(
    #   _In_   HDC hdc,
    #   _In_   UINT uChar,
    #   _In_   UINT uFormat,
    #   _Out_  LPGLYPHMETRICS lpgm,
    #   _In_   DWORD cbBuffer,
    #   _Out_  LPVOID lpvBuffer,
    #   _In_   const MAT2 *lpmat2 )
    encoded_function 'GetGlyphOutline', [:hdc, :uint, GetGlyphOutlineFormat, GLYPHMETRICS.ptr(:out), :dword, :pointer, MAT2.ptr(:in)], :dword

    # https://msdn.microsoft.com/en-us/library/dd144895(v=vs.85).aspx
    # DWORD GetKerningPairs(
    #   _In_   HDC hdc,
    #   _In_   DWORD nNumPairs,
    #   _Out_  LPKERNINGPAIR lpkrnpair )
    encoded_function 'GetKerningPairs', [:hdc, :dword, KERNINGPAIR.ptr(:out)], :dword

    # https://msdn.microsoft.com/en-us/library/dd144906(v=vs.85).aspx
    # UINT GetOutlineTextMetrics(
    #   _In_       HDC hdc,
    #   _In_       UINT cbData,
    #   _Out_opt_  LPOUTLINETEXTMETRIC lpOTM )
    encoded_function 'GetOutlineTextMetrics', [:hdc, :uint, OUTLINETEXTMETRIC], :uint

    # https://msdn.microsoft.com/en-us/library/dd144919(v=vs.85).aspx
    # BOOL GetRasterizerCaps(
    #   _Out_  LPRASTERIZER_STATUS lprs,
    #   _In_   UINT cb )
    attach_function 'GetRasterizerCaps',  [RASTERIZER_STATUS.ptr(:out), :uint], :bool

    # https://msdn.microsoft.com/en-us/library/dd144932(v=vs.85).aspx
    # UINT GetTextAlign( _In_  HDC hdc )
    attach_function 'GetTextAlign', [:hdc], :uint

    # https://msdn.microsoft.com/en-us/library/dd144933(v=vs.85).aspx
    # int GetTextCharacterExtra( _In_  HDC hdc )
    attach_function 'GetTextCharacterExtra', [:hdc], :int

    # https://msdn.microsoft.com/en-us/library/dd144934(v=vs.85).aspx
    # COLORREF GetTextColor( _In_  HDC hdc )
    attach_function 'GetTextColor', [:hdc], :colorref

    # https://msdn.microsoft.com/en-us/library/dd144935(v=vs.85).aspx
    # BOOL GetTextExtentExPoint(
    #   _In_   HDC hdc,
    #   _In_   LPCTSTR lpszStr,
    #   _In_   int cchString,
    #   _In_   int nMaxExtent,
    #   _Out_  LPINT lpnFit,
    #   _Out_  LPINT alpDx,
    #   _Out_  LPSIZE lpSize )
    encoded_function 'GetTextExtentExPoint', [:hdc, :string, :int, :int, :pointer, :pointer, SIZE.ptr(:out)], :bool

    # https://msdn.microsoft.com/en-us/library/dd144936(v=vs.85).aspx
    # BOOL GetTextExtentExPointI(
    #   _In_   HDC hdc,
    #   _In_   LPWORD pgiIn,
    #   _In_   int cgi,
    #   _In_   int nMaxExtent,
    #   _Out_  LPINT lpnFit,
    #   _Out_  LPINT alpDx,
    #   _Out_  LPSIZE lpSize )
    attach_function 'GetTextExtentExPointI', [:hdc, :pointer, :int, :int, :pointer, :pointer, SIZE.ptr(:out)], :bool

    # https://msdn.microsoft.com/en-us/library/dd144937(v=vs.85).aspx
    # BOOL GetTextExtentPoint(
    #   _In_   HDC hdc,
    #   _In_   LPCTSTR lpString,
    #   _In_   int cbString,
    #   _Out_  LPSIZE lpSize )
    encoded_function 'GetTextExtentPoint', [:hdc, :string, :int, SIZE.ptr(:out)], :bool

    # https://msdn.microsoft.com/en-us/library/dd144938(v=vs.85).aspx
    # BOOL GetTextExtentPoint32(
    #   _In_   HDC hdc,
    #   _In_   LPCTSTR lpString,
    #   _In_   int c,
    #   _Out_  LPSIZE lpSize )
    encoded_function 'GetTextExtentPoint32', [:hdc, :string, :int, SIZE.ptr(:out)], :bool

    # https://msdn.microsoft.com/en-us/library/dd144939(v=vs.85).aspx
    # BOOL GetTextExtentPointI(
    #   _In_   HDC hdc,
    #   _In_   LPWORD pgiIn,
    #   _In_   int cgi,
    #   _Out_  LPSIZE lpSize )
    attach_function 'GetTextExtentPointI', [:hdc, :pointer, :int, SIZE.ptr(:out)], :bool

    # https://msdn.microsoft.com/en-us/library/dd144940(v=vs.85).aspx
    # int GetTextFace(
    #   _In_   HDC hdc,
    #   _In_   int nCount,
    #   _Out_  LPTSTR lpFaceName )
    encoded_function 'GetTextFace', [:hdc, :int, :string], :int

    # https://msdn.microsoft.com/en-us/library/dd144941(v=vs.85).aspx
    # BOOL GetTextMetrics(
    #   _In_   HDC hdc,
    #   _Out_  LPTEXTMETRIC lptm )
    encoded_function 'GetTextMetrics', [:hdc, TEXTMETRIC.ptr(:out)], :bool

    # https://msdn.microsoft.com/en-us/library/dd162821(v=vs.85).aspx
    # BOOL PolyTextOut(
    #   _In_  HDC hdc,
    #   _In_  const POLYTEXT *pptxt,
    #   _In_  int cStrings )
    encoded_function 'PolyTextOut', [:hdc, POLYTEXT.ptr(:in), :int], :bool

    # https://msdn.microsoft.com/en-us/library/dd162921(v=vs.85).aspx
    # BOOL RemoveFontMemResourceEx( _In_  HANDLE fh )
    attach_function 'RemoveFontMemResourceEx', [:handle], :bool

    # https://msdn.microsoft.com/en-us/library/dd162922(v=vs.85).aspx
    # BOOL RemoveFontResource( _In_  LPCTSTR lpFileName )
    encoded_function 'RemoveFontResource', [:string], :bool

    # https://msdn.microsoft.com/en-us/library/dd162923(v=vs.85).aspx
    # BOOL RemoveFontResourceEx(
    #   _In_  LPCTSTR lpFileName,
    #   _In_  DWORD fl,
    #   _In_  PVOID pdv )
    encoded_function 'RemoveFontResourceEx', [:string, :dword, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/dd162981(v=vs.85).aspx
    # DWORD SetMapperFlags(
    #   _In_  HDC hdc,
    #   _In_  DWORD dwFlag )
    attach_function 'SetMapperFlags', [:hdc, :dword], :dword

    # https://msdn.microsoft.com/en-us/library/dd145091(v=vs.85).aspx
    # UINT SetTextAlign(
    #   _In_  HDC hdc,
    #   _In_  UINT fMode )
    attach_function 'SetTextAlign', [:hdc, TextAlignFlag], :uint

    # https://msdn.microsoft.com/en-us/library/dd145092(v=vs.85).aspx
    # int SetTextCharacterExtra(
    #   _In_  HDC hdc,
    #   _In_  int nCharExtra )
    attach_function 'SetTextCharacterExtra', [:hdc, :int], :int

    # https://msdn.microsoft.com/en-us/library/dd145093(v=vs.85).aspx
    # COLORREF SetTextColor(
    #   _In_  HDC hdc,
    #   _In_  COLORREF crColor )
    attach_function 'SetTextColor', [:hdc, :colorref], :colorref

    # https://msdn.microsoft.com/en-us/library/dd145094(v=vs.85).aspx
    # BOOL SetTextJustification(
    #   _In_  HDC hdc,
    #   _In_  int nBreakExtra,
    #   _In_  int nBreakCount )
    attach_function 'SetTextJustification', [:hdc, :int, :int], :bool

    # https://msdn.microsoft.com/en-us/library/dd145133(v=vs.85).aspx
    # BOOL TextOut(
    #   _In_  HDC hdc,
    #   _In_  int nXStart,
    #   _In_  int nYStart,
    #   _In_  LPCTSTR lpString,
    #   _In_  int cchString )
    encoded_function 'TextOut', [:hdc, :int, :int, :string, :int], :bool
  end
end