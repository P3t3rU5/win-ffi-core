require 'win-ffi/user32'

require 'win-ffi/user32/enum/painting_drawing/draw_caption_flag'
require 'win-ffi/user32/enum/painting_drawing/edge_flag'
require 'win-ffi/user32/enum/painting_drawing/border_flag'
require 'win-ffi/user32/enum/painting_drawing/draw_frame_control_flag'
require 'win-ffi/user32/enum/painting_drawing/draw_frame_control_state_flag'
require 'win-ffi/user32/enum/painting_drawing/redraw_window_flag'
require 'win-ffi/user32/enum/painting_drawing/draw_text_format_flag'

require 'win-ffi/general/struct/rect'
require 'win-ffi/user32/struct/painting_drawing/paint_struct'
require 'win-ffi/user32/struct/painting_drawing/draw_text_params'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd183362(v=vs.85).aspx
    # HDC BeginPaint(
    #   _In_   HWND hwnd,
    #   _Out_  LPPAINTSTRUCT lpPaint )
    attach_function 'BeginPaint', [:hwnd, PAINTSTRUCT.ptr(:out)], :hdc

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162475(v=vs.85).aspx
    # BOOL DrawAnimatedRects(
    #   _In_  HWND hwnd,
    #   _In_  int idAni,
    #   const RECT *lprcFrom,
    #   const RECT *lprcTo )
    attach_function 'DrawAnimatedRects', [:hwnd, :int, RECT.ptr, RECT.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162476(v=vs.85).aspx
    # BOOL DrawCaption(
    #   _In_  HWND hwnd,
    #   _In_  HDC hdc,
    #   _In_  LPCRECT lprc,
    #   _In_  UINT uFlags )
    attach_function 'DrawCaption', [:hwnd, :hdc, RECT.ptr(:in), DrawCaptionFlag], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162477(v=vs.85).aspx
    # BOOL DrawEdge(
    #   _In_     HDC hdc,
    #   _Inout_  LPRECT qrc,
    #   _In_     UINT edge,
    #   _In_     UINT grfFlags )
    attach_function 'DrawEdge', [:hdc, RECT.ptr, EdgeFlag, BorderFlag], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162479(v=vs.85).aspx
    # BOOL DrawFocusRect(
    #   _In_  HDC hDC,
    #   _In_  const RECT *lprc )
    attach_function 'DrawFocusRect', [:hdc, RECT.ptr(:in)], :bool

    # https://www.google.pt/search?q=DrawFrameControl&oq=DrawFrameControl&aqs=chrome..69i57j0l5.10631j0j4&sourceid=chrome&es_sm=93&ie=UTF-8
    # BOOL DrawFrameControl(
    #   _In_  HDC hdc,
    #   _In_  LPRECT lprc,
    #   _In_  UINT uType,
    #   _In_  UINT uState )
    attach_function 'DrawFrameControl', [:hdc, RECT.ptr(:in), DrawFrameControlFlag, DrawFrameControlStateFlag], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162497(v=vs.85).aspx
    # BOOL CALLBACK DrawStateProc(
    #   _In_  HDC hdc,
    #   _In_  LPARAM lData,
    #   _In_  WPARAM wData,
    #   _In_  int cx,
    #   _In_  int cy )
    DrawStateProc = callback 'DrawStateProc', [:hdc, :lparam, :wparam, :int, :int], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162496(v=vs.85).aspx
    # BOOL DrawState(
    #   _In_  HDC hdc,
    #   _In_  HBRUSH hbr,
    #   _In_  DRAWSTATEPROC lpOutputFunc,
    #   _In_  LPARAM lData,
    #   _In_  WPARAM wData,
    #   _In_  int x,
    #   _In_  int y,
    #   _In_  int cx,
    #   _In_  int cy,
    #   _In_  UINT fuFlags, DrawStateState or DrawStateType )
    encoded_function 'DrawState', [:hdc, :hbrush, DrawStateProc, :lparam, :wparam, :int, :int, :int, :int, :uint], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162598(v=vs.85).aspx
    # BOOL EndPaint(
    #   _In_  HWND hWnd,
    #   _In_  const PAINTSTRUCT *lpPaint )
    attach_function 'EndPaint', [:hwnd, PAINTSTRUCT.ptr(:in)], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162703(v=vs.85).aspx
    # int ExcludeUpdateRgn(
    #   _In_  HDC hDC,
    #   _In_  HWND hWnd )
    attach_function 'ExcludeUpdateRgn', [:hdc, :hwnd], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd144947(v=vs.85).aspx
    # HDC GetWindowDC( _In_  HWND hWnd )
    attach_function 'GetWindowDC', [:hwnd], :hdc

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd144943(v=vs.85).aspx
    # BOOL GetUpdateRect(
    #   _In_   HWND hWnd,
    #   _Out_  LPRECT lpRect,
    #   _In_   BOOL bErase )
    attach_function 'GetUpdateRect', [:hwnd, RECT.ptr(:out), :bool], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd144944(v=vs.85).aspx
    # int GetUpdateRgn(
    #   _In_  HWND hWnd,
    #   _In_  HRGN hRgn,
    #   _In_  BOOL bErase )
    attach_function 'GetUpdateRgn', [:hwnd, :hrgn, :bool], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd144950(v=vs.85).aspx
    # int GetWindowRgn(
    #   _In_  HWND hWnd,
    #   _In_  HRGN hRgn)
    attach_function 'GetWindowRgn', [:hwnd, :hrgn], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd144963(v=vs.85).aspx
    # BOOL GrayString(
    #   _In_  HDC hDC,
    #   _In_  HBRUSH hBrush,
    #   _In_  GRAYSTRINGPROC lpOutputFunc,
    #   _In_  LPARAM lpData,
    #   _In_  int nCount,
    #   _In_  int X,
    #   _In_  int Y,
    #   _In_  int nWidth,
    #   _In_  int nHeight )
    encoded_function 'GrayString', [:hdc, :hbrush, :pointer, :lparam, :int, :int, :int, :int, :int], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145002(v=vs.85).aspx
    # BOOL InvalidateRect(
    #   __in  HWND        hWnd,
    #   __in  const RECT *lpRect,
    #   __in  BOOL        bErase)
    attach_function 'InvalidateRect', [:hwnd, RECT.ptr, :bool], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145003(v=vs.85).aspx
    # BOOL InvalidateRgn(
    #   _In_  HWND hWnd,
    #   _In_  HRGN hRgn,
    #   _In_  BOOL bErase )
    attach_function 'InvalidateRgn', [:hwnd, :hrgn, :bool], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145034(v=vs.85).aspx
    # BOOL LockWindowUpdate( _In_  HWND hWndLock )
    attach_function 'LockWindowUpdate', [:hwnd], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162756(v=vs.85).aspx
    # BOOL CALLBACK OutputProc(
    #   _In_  HDC hdc,
    #   _In_  LPARAM lpData,
    #   _In_  int cchData )
    callback 'OutputProc', [:hdc, :lparam, :int], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162758(v=vs.85).aspx
    # BOOL PaintDesktop( _In_  HDC hdc )
    attach_function 'PaintDesktop', [:hdc], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162911(v=vs.85).aspx
    # BOOL RedrawWindow(
    #   _In_  HWND hWnd,
    #   _In_  const RECT *lprcUpdate,
    #   _In_  HRGN hrgnUpdate,
    #   _In_  UINT flags )
    attach_function 'RedrawWindow', [:hwnd, RECT.ptr, :hrgn, RedrawWindowFlag], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145102(v=vs.85).aspx
    # int SetWindowRgn(
    #   _In_  HWND hWnd,
    #   _In_  HRGN hRgn,
    #   _In_  BOOL bRedraw )
    attach_function 'SetWindowRgn', [:hwnd, :hrgn, :bool], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145167(v=vs.85).aspx
    # BOOL UpdateWindow( __int  HWND hWnd)
    attach_function 'UpdateWindow', [:hwnd], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145194(v=vs.85).aspx
    # BOOL ValidateRect(
    #   __in  HWND        hWnd,
    #   __in  const RECT *lpRect)
    attach_function 'ValidateRect', [:hwnd, RECT.ptr(:in)], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145195(v=vs.85).aspx
    # BOOL ValidateRgn(
    #   _In_  HWND hWnd,
    #   _In_  HRGN hRgn )
    attach_function 'ValidateRgn', [:hwnd, :hrgn], :bool

    # Text
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162498(v=vs.85).aspx
    # int DrawText(
    #   _In_     HDC hDC,
    #   _Inout_  LPCTSTR lpchText,
    #   _In_     int nCount,
    #   _Inout_  LPRECT lpRect,
    #   _In_     UINT uFormat )
    encoded_function 'DrawText', [:hdc, :string, :int, RECT.ptr, DrawTextFormatFlag], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162499(v=vs.85).aspx
    # int DrawTextEx(
    #   _In_     HDC hdc,
    #   _Inout_  LPTSTR lpchText,
    #   _In_     int cchText,
    #   _Inout_  LPRECT lprc,
    #   _In_     UINT dwDTFormat,
    #   _In_     LPDRAWTEXTPARAMS lpDTParams )
    encoded_function 'DrawTextEx', [:hdc, :string, :int, RECT.ptr, DrawTextFormatFlag, DRAWTEXTPARAMS.ptr(:in)], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd144930(v=vs.85).aspx
    # DWORD GetTabbedTextExtent(
    #   _In_  HDC hDC,
    #   _In_  LPCTSTR lpString,
    #   _In_  int nCount,
    #   _In_  int nTabPositions,
    #   _In_  const LPINT lpnTabStopPositions )
    encoded_function 'GetTabbedTextExtent', [:hdc, :string, :int, :int, :pointer], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145129(v=vs.85).aspx
    # LONG TabbedTextOut(
    #   _In_  HDC hDC,
    #   _In_  int X,
    #   _In_  int Y,
    #   _In_  LPCTSTR lpString,
    #   _In_  int nCount,
    #   _In_  int nTabPositions,
    #   _In_  const LPINT lpnTabStopPositions,
    #   _In_  int nTabOrigin )
    encoded_function 'TabbedTextOut', [:hdc, :int, :int, :string, :int, :int, :pointer, :int], :long

    if WindowsVersion >= :xp
      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd144951(v=vs.85).aspx
      # int GetWindowRgnBox(
      #   _In_   HWND hWnd,
      #   _Out_  LPRECT lprc )
      attach_function 'GetWindowRgnBox', [:hwnd, RECT.ptr(:out)], :int
    end
  end
end