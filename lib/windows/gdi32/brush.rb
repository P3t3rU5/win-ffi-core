module WinFFI
  module Gdi32
    module Brush
      ffi_lib 'gdi32'

      HatchStyles = enum :hatch_styles, [
          :HORIZONTAL, 0, # -----
          :VERTICAL,   1, # |||||
          :FDIAGONAL,  2, # \\\\\
          :BDIAGONAL,  3, # /////
          :CROSS,      4, # +++++
          :DIAGCROSS,  5, # xxxxx
      ]

      #HBRUSH CreateBrushIndirect( _In_  const LOGBRUSH *lplb )
      attach_function 'CreateBrushIndirect', [LOGBRUSH.ptr], :hbrush

      #HBRUSH CreateDIBPatternBrush(
      #  _In_  HGLOBAL hglbDIBPacked,
      #  _In_  UINT fuColorSpec )
      attach_function 'CreateDIBPatternBrush', [:hglobal, :uint], :hbrush

      #HBRUSH CreateDIBPatternBrushPt(
      #  _In_  const VOID *lpPackedDIB,
      #  _In_  UINT iUsage )
      attach_function 'CreateDIBPatternBrushPt', [:pointer, :uint], :hbrush

      #HBRUSH CreateHatchBrush(
      #  _In_  int fnStyle,
      #  _In_  COLORREF clrref )
      attach_function 'CreateHatchBrush', [HatchStyles, :colorref], :hbrush

      #HBRUSH CreatePatternBrush( _In_  HBITMAP hbmp )
      attach_function 'CreatePatternBrush', [:hbitmap], :hbrush

      #HBRUSH CreateSolidBrush( _In_  COLORREF crColor )
      attach_function 'CreateSolidBrush', [:colorref], :hbrush

      #BOOL GetBrushOrgEx(
      #  _In_   HDC hdc,
      #  _Out_  LPPOINT lppt )
      attach_function 'GetBrushOrgEx', [:hdc, POINT.ptr], :bool

      #BOOL PatBlt(
      #  _In_  HDC hdc,
      #  _In_  int nXLeft,
      #  _In_  int nYLeft,
      #  _In_  int nWidth,
      #  _In_  int nHeight,
      #  _In_  DWORD dwRop )
      attach_function 'PatBlt', [:hdc, :int, :int, :int, :int, :dword], :bool

      #BOOL SetBrushOrgEx(
      #  _In_   HDC hdc,
      #  _In_   int nXOrg,
      #  _In_   int nYOrg,
      #  _Out_  LPPOINT lppt )
      attach_function 'SetBrushOrgEx', [:hdc, :int, :int, POINT.ptr], :bool

      ffi_lib 'user32'

      #HBRUSH GetSysColorBrush( _In_  int nIndex )
      attach_function 'GetSysColorBrush', [ColorTypes], :int
    end
  end
end