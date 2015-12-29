require 'win-ffi/user32'

require 'win-ffi/user32/enum/draw_caption_flags'
require 'win-ffi/user32/enum/edge_flags'
require 'win-ffi/user32/enum/border_flags'
require 'win-ffi/user32/enum/draw_frame_control_flags'
require 'win-ffi/user32/enum/draw_frame_control_state_flags'
require 'win-ffi/user32/enum/redraw_window_flags'

require 'win-ffi/general/struct/rect'
require 'win-ffi/user32/struct/paint_struct'

module WinFFI
  module User32
    #HDC BeginPaint(
    #  _In_   HWND hwnd,
    #  _Out_  LPPAINTSTRUCT lpPaint )
    attach_function 'BeginPaint', [:hwnd, PAINTSTRUCT.ptr], :hdc

    #BOOL DrawAnimatedRects(
    #  _In_  HWND hwnd,
    #  _In_  int idAni,
    #  const RECT *lprcFrom,
    #  const RECT *lprcTo )
    attach_function 'DrawAnimatedRects', [:hwnd, :int, RECT.ptr, RECT.ptr], :bool

    #BOOL DrawCaption(
    #  _In_  HWND hwnd,
    #  _In_  HDC hdc,
    #  _In_  LPCRECT lprc,
    #  _In_  UINT uFlags )
    attach_function 'DrawCaption', [:hwnd, :hdc, RECT.ptr, DrawCaptionFlags], :bool

    #BOOL DrawEdge(
    #  _In_     HDC hdc,
    #  _Inout_  LPRECT qrc,
    #  _In_     UINT edge,
    #  _In_     UINT grfFlags )
    attach_function 'DrawEdge', [:hdc, RECT.ptr, EdgeFlags, BorderFlags], :bool

    #BOOL DrawFocusRect(
    #  _In_  HDC hDC,
    #  _In_  const RECT *lprc )
    attach_function 'DrawFocusRect', [:hdc, RECT.ptr], :bool

    #BOOL DrawFrameControl(
    #  _In_  HDC hdc,
    #  _In_  LPRECT lprc,
    #  _In_  UINT uType,
    #  _In_  UINT uState )
    attach_function 'DrawFrameControl', [:hdc, RECT.ptr, DrawFrameControlFlags, DrawFrameControlStateFlags], :bool

    #BOOL DrawState(
    #  _In_  HDC hdc,
    #  _In_  HBRUSH hbr,
    #  _In_  DRAWSTATEPROC lpOutputFunc,
    #  _In_  LPARAM lData,
    #  _In_  WPARAM wData,
    #  _In_  int x,
    #  _In_  int y,
    #  _In_  int cx,
    #  _In_  int cy,
    #  _In_  UINT fuFlags, DrawStateState or DrawStateType )
    encoded_function 'DrawState', [:hdc, :hbrush, :pointer, :lparam, :wparam, :int, :int, :int, :int, :uint], :bool

    #BOOL CALLBACK DrawStateProc(
    #  _In_  HDC hdc,
    #  _In_  LPARAM lData,
    #  _In_  WPARAM wData,
    #  _In_  int cx,
    #  _In_  int cy )
    callback 'DrawStateProc', [:hdc, :lparam, :wparam, :int, :int], :bool

    #BOOL EndPaint(
    #  _In_  HWND hWnd,
    #  _In_  const PAINTSTRUCT *lpPaint )
    attach_function 'EndPaint', [:hwnd, PAINTSTRUCT.ptr], :bool

    #int ExcludeUpdateRgn(
    #  _In_  HDC hDC,
    #  _In_  HWND hWnd )
    attach_function 'ExcludeUpdateRgn', [:hdc, :hwnd], :int

    #HDC GetWindowDC( _In_  HWND hWnd )
    attach_function 'GetWindowDC', [:hwnd], :hdc

    #BOOL GetUpdateRect(
    #  _In_   HWND hWnd,
    #  _Out_  LPRECT lpRect,
    #  _In_   BOOL bErase )
    attach_function 'GetUpdateRect', [:hwnd, RECT.ptr, :bool], :bool

    #int GetUpdateRgn(
    #  _In_  HWND hWnd,
    #  _In_  HRGN hRgn,
    #  _In_  BOOL bErase )
    attach_function 'GetUpdateRgn', [:hwnd, :hrgn, :bool], :int

    #int GetWindowRgn(
    #  _In_  HWND hWnd,
    #  _In_  HRGN hRgn)
    attach_function 'GetWindowRgn', [:hwnd, :hrgn], :int

    if WindowsVersion >= :xp
      #int GetWindowRgnBox(
      #  _In_   HWND hWnd,
      #  _Out_  LPRECT lprc )
      attach_function 'GetWindowRgnBox', [:hwnd, RECT.ptr], :int
    end

    #BOOL GrayString(
    #  _In_  HDC hDC,
    #  _In_  HBRUSH hBrush,
    #  _In_  GRAYSTRINGPROC lpOutputFunc,
    #  _In_  LPARAM lpData,
    #  _In_  int nCount,
    #  _In_  int X,
    #  _In_  int Y,
    #  _In_  int nWidth,
    #  _In_  int nHeight )
    encoded_function 'GrayString', [:hdc, :hbrush, :pointer, :lparam, :int, :int, :int, :int, :int], :bool

    #BOOL InvalidateRect(
    #  __in  HWND        hWnd,
    #  __in  const RECT *lpRect,
    #  __in  BOOL        bErase)
    attach_function 'InvalidateRect', [:hwnd, RECT.ptr, :bool], :bool

    #BOOL InvalidateRgn(
    #  _In_  HWND hWnd,
    #  _In_  HRGN hRgn,
    #  _In_  BOOL bErase )
    attach_function 'InvalidateRgn', [:hwnd, :hrgn, :bool], :bool

    #BOOL LockWindowUpdate( _In_  HWND hWndLock )
    attach_function 'LockWindowUpdate', [:hwnd], :bool

    #BOOL CALLBACK OutputProc(
    #  _In_  HDC hdc,
    #  _In_  LPARAM lpData,
    #  _In_  int cchData )
    callback 'OutputProc', [:hdc, :lparam, :int], :bool

    #BOOL PaintDesktop( _In_  HDC hdc )
    attach_function 'PaintDesktop', [:hdc], :bool

    #BOOL RedrawWindow(
    #  _In_  HWND hWnd,
    #  _In_  const RECT *lprcUpdate,
    #  _In_  HRGN hrgnUpdate,
    #  _In_  UINT flags )
    attach_function 'RedrawWindow', [:hwnd, RECT, :hrgn, RedrawWindowFlags], :bool

    #int SetWindowRgn(
    #  _In_  HWND hWnd,
    #  _In_  HRGN hRgn,
    #  _In_  BOOL bRedraw )
    attach_function 'SetWindowRgn', [:hwnd, :hrgn, :bool], :int

    #BOOL UpdateWindow(
    #  __int  HWND hWnd)
    attach_function 'UpdateWindow', [:hwnd], :bool

    #BOOL ValidateRect(
    #  __in  HWND        hWnd,
    #  __in  const RECT *lpRect)
    attach_function 'ValidateRect', [:hwnd, RECT.ptr], :bool

    #BOOL ValidateRgn(
    #  _In_  HWND hWnd,
    #  _In_  HRGN hRgn )
    attach_function 'ValidateRgn', [:hwnd, :hrgn], :bool
  end
end