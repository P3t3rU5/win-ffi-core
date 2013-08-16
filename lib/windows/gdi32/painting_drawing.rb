module WinFFI
  module Gdi32
    module PaintingDrawing
      extend LibBase

      ffi_lib 'user32'

      DrawCaptionFlags = enum :draw_caption_flags, [
          :ACTIVE,   0x0001,
          :SMALLCAP, 0x0002,
          :ICON,     0x0004,
          :TEXT,     0x0008,
          :INBUTTON, 0x0010,
          :GRADIENT, 0x0020,
          :BUTTONS,  0x1000
      ]

      # 3D border styles
      EdgeFlags = enum :border_flags, [
          :RAISEDOUTER, 0x0001,
          :SUNKENOUTER, 0x0002,
          :OUTER,       0x0003,
          :RAISEDINNER, 0x0004,
          :RAISED,      0x0005,
          :ETCHED,      0x0006,
          :SUNKENINNER, 0x0008,
          :BUMP,        0x0009,
          :SUNKEN,      0x0010,
          :INNER,       0x0012,
      ]

      # Border flags
      BorderFlags = enum :border_flags, [
          :LEFT,                    0x0001,
          :TOP,                     0x0002,
          :TOPLEFT,                 0x0003,
          :RIGHT,                   0x0004,
          :TOPRIGHT,                0x0006,
          :BOTTOM,                  0x0008,
          :BOTTOMLEFT,              0x0009,
          :DIAGONAL,                0x0010,
          :BOTTOMRIGHT,             0x0012,
          :RECT,                    0x0015,
          :DIAGONAL_ENDTOPLEFT,     0x0019,
          :DIAGONAL_ENDTOPRIGHT,    0x0022,
          :DIAGONAL_ENDBOTTOMLEFT,  0x0025,
          :DIAGONAL_ENDBOTTOMRIGHT, 0x0028,
          :MIDDLE,                  0x0800, # Fill in the middle
          :SOFT,                    0x1000, # For softer buttons
          :ADJUST,                  0x2000, # Calculate the space left over
          :FLAT,                    0x4000, # For flat rather than 3D borders
          :MONO,                    0x8000 # For monochrome borders
      ]

      # Flags for DrawFrameControl
      DrawFrameControlFlags = enum :draw_frame_control_flags, [
          :CAPTION,    1,
          :MENU,       2,
          :SCROLL,     3,
          :BUTTON,     4,
          :POPUPMENU,  5
      ]

      DrawFrameControlStateFlags = enum :draw_frame_control_state_flags, [

          :CAPTIONCLOSE,   0x0000,
          :CAPTIONMIN,     0x0001,
          :CAPTIONMAX,     0x0002,
          :CAPTIONRESTORE, 0x0003,
          :CAPTIONHELP,    0x0004,

          :MENUARROW,           0x0000,
          :MENUCHECK,           0x0001,
          :MENUBULLET,          0x0002,
          :MENUARROWRIGHT,      0x0004,
          :SCROLLUP,            0x0000,
          :SCROLLDOWN,          0x0001,
          :SCROLLLEFT,          0x0002,
          :SCROLLRIGHT,         0x0003,
          :SCROLLCOMBOBOX,      0x0005,
          :SCROLLSIZEGRIP,      0x0008,
          :SCROLLSIZEGRIPRIGHT, 0x0010,

          :BUTTONCHECK,      0x0000,
          :BUTTONRADIOIMAGE, 0x0001,
          :BUTTONRADIOMASK,  0x0002,
          :BUTTONRADIO,      0x0004,
          :BUTTON3STATE,     0x0008,
          :BUTTONPUSH,       0x0010,

          :INACTIVE, 0x0100,
          :PUSHED,   0x0200,
          :CHECKED,  0x0400,

          :TRANSPARENT, 0x0800,
          :HOT,         0x1000,

          :ADJUSTRECT, 0x2000,
          :FLAT,       0x4000,
          :MONO,       0x8000,
      ]

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
      #  _In_  UINT fuFlags )
      attach_function 'DrawStateA', [:hdc, :pointer, :lparam, :wparam, :int, :int, :int, :int, :uint], :bool
      attach_function 'DrawStateW', [:hdc, :hbrush, :pointer, :lparam, :wparam, :int, :int, :int, :int, :uint], :bool

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

      #int GetWindowRgnBox(
      #  _In_   HWND hWnd,
      #  _Out_  LPRECT lprc )
      attach_function 'GetWindowRgnBox', [:hwnd, RECT.ptr], :int

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
      attach_function 'GrayStringA', [:hdc, :hbrush, :pointer, :lparam, :int, :int, :int, :int, :int], :bool
      attach_function 'GrayStringW', [:hdc, :hbrush, :pointer, :lparam, :int, :int, :int, :int, :int], :bool

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
      attach_function 'RedrawWindow', [:hwnd, RECT, :hrgn], :bool

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

      ffi_lib 'gdi32'

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
end
