module WinFFI
  module Gdi32
    module FilledShape
      extend LibBase

      ffi_lib 'gdi32'

      #BOOL Chord(
      #  _In_  HDC hdc,
      #  _In_  int nLeftRect,
      #  _In_  int nTopRect,
      #  _In_  int nRightRect,
      #  _In_  int nBottomRect,
      #  _In_  int nXRadial1,
      #  _In_  int nYRadial1,
      #  _In_  int nXRadial2,
      #  _In_  int nYRadial2 )
      attach_function 'Chord', [:hdc, :int, :int, :int, :int, :int, :int, :int, :int], :bool

      #BOOL Ellipse(
      #  _In_  HDC hdc,
      #  _In_  int nLeftRect,
      #  _In_  int nTopRect,
      #  _In_  int nRightRect,
      #  _In_  int nBottomRect )
      attach_function 'Ellipse', [:hdc, :int, :int, :int, :int], :bool

      #BOOL Pie(
      #  _In_  HDC hdc,
      #  _In_  int nLeftRect,
      #  _In_  int nTopRect,
      #  _In_  int nRightRect,
      #  _In_  int nBottomRect,
      #  _In_  int nXRadial1,
      #  _In_  int nYRadial1,
      #  _In_  int nXRadial2,
      #  _In_  int nYRadial2 )
      attach_function 'Pie', [:hdc, :int, :int, :int, :int, :int, :int, :int, :int], :bool

      #BOOL Polygon(
      #  _In_  HDC hdc,
      #  _In_  const POINT *lpPoints,
      #  _In_  int nCount )
      attach_function 'Polygon', [:hdc, POINT.ptr, :int], :bool

      #BOOL PolyPolygon(
      #  _In_  HDC hdc,
      #  _In_  const POINT *lpPoints,
      #  _In_  const INT *lpPolyCounts,
      #  _In_  int nCount )
      attach_function 'PolyPolygon', [:hdc, POINT.ptr, :pointer, :int], :bool

      #BOOL Rectangle(
      #  _In_  HDC hdc,
      #  _In_  int nLeftRect,
      #  _In_  int nTopRect,
      #  _In_  int nRightRect,
      #  _In_  int nBottomRect )
      attach_function 'Rectangle', [:hdc, :int, :int, :int, :int], :bool

      #BOOL RoundRect(
      #  _In_  HDC hdc,
      #  _In_  int nLeftRect,
      #  _In_  int nTopRect,
      #  _In_  int nRightRect,
      #  _In_  int nBottomRect,
      #  _In_  int nWidth,
      #  _In_  int nHeight )
      attach_function 'RoundRect', [:hdc, :int, :int, :int, :int, :int, :int], :bool

      ffi_lib 'user32'

      #int FillRect(
      #  _In_  HDC hDC,
      #  _In_  const RECT *lprc,
      #  _In_  HBRUSH hbr )
      attach_function 'FillRect', [:hdc, RECT.ptr, :hbrush], :int

      #int FrameRect(
      #  _In_  HDC hDC,
      #  _In_  const RECT *lprc,
      #  _In_  HBRUSH hbr )
      attach_function 'FrameRect', [:hdc, RECT.ptr, :hbrush], :int

      #BOOL InvertRect(
      #  _In_  HDC hDC,
      #  _In_  const RECT *lprc )
      attach_function 'InvertRect', [:hdc, RECT.ptr], :bool
    end
  end
end