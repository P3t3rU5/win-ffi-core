module WinFFI
  module Gdi32
    #BOOL GdiFlush(void)
    attach_function 'GdiFlush', [:void], :bool

    #DWORD GdiGetBatchLimit(void)
    attach_function 'GdiGetBatchLimit', [:void], :dword

    #DWORD GdiSetBatchLimit( _In_  DWORD dwLimit )
    attach_function 'GdiSetBatchLimit', [:dword], :dword

    #COLORREF GetBkColor( _In_  HDC hdc )
    attach_function 'GetBkColor', [:hdc], :colorref

    #int GetBkMode( _In_  HDC hdc )
    attach_function 'GetBkMode', [:hdc], :int

    #UINT GetBoundsRect(
    #  _In_   HDC hdc,
    #  _Out_  LPRECT lprcBounds,
    #  _In_   UINT flags )
    attach_function 'GetBoundsRect', [:hdc, RECT.ptr, :uint], :uint

    #int GetROP2( _In_  HDC hdc )
    attach_function 'GetROP2', [:hdc], :int

    #COLORREF SetBkColor(
    #  _In_  HDC hdc,
    #  _In_  COLORREF crColor )
    attach_function 'SetBkColor', [:hdc, :colorref], :colorref

    #int SetBkMode(
    #  _In_  HDC hdc,
    #  _In_  int iBkMode )
    attach_function 'SetBkMode', [:hdc, :int], :int

    #UINT SetBoundsRect(
    #  _In_  HDC hdc,
    #  _In_  const RECT *lprcBounds,
    #  _In_  UINT flags )
    attach_function 'SetBoundsRect', [:hdc, RECT.ptr, :uint], :uint

    #int SetROP2(
    #  _In_  HDC hdc,
    #  _In_  int fnDrawMode )
    attach_function 'SetROP2', [:hdc, :int], :int
  end
end
