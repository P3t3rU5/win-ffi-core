require 'win-ffi/functions/user32'

require 'win-ffi/enums/user32/mouse_keys_flags'
require 'win-ffi/enums/user32/mouse_event_flags'

require 'lib/win-ffi/structs/point'
require 'win-ffi/structs/user32/mouse_move_point'
require 'win-ffi/structs/user32/track_mouse_event'

module WinFFI
  module User32

    #BOOL WINAPI _TrackMouseEvent(
    #  _Inout_  LPTRACKMOUSEEVENT lpEventTrack )
    #attach_function '_TrackMouseEvent', [TRACKMOUSEEVENT.ptr], :bool

    #BOOL WINAPI DragDetect(
    #  _In_  HWND hwnd,
    #  _In_  POINT pt )
    attach_function 'DragDetect', [:hwnd, POINT], :bool

    #HWND WINAPI GetCapture(void)
    attach_function 'GetCapture', [], :hwnd

    #UINT WINAPI GetDoubleClickTime(void)
    attach_function 'GetDoubleClickTime', [:void], :uint

    #int WINAPI GetMouseMovePointsEx(
    #  _In_   UINT cbSize,
    #  _In_   LPMOUSEMOVEPOINT lppt,
    #  _Out_  LPMOUSEMOVEPOINT lpptBuf,
    #  _In_   int nBufPoints,
    #  _In_   DWORD resolution )
    attach_function 'GetMouseMovePointsEx', [:uint, MOUSEMOVEPOINT.ptr, MOUSEMOVEPOINT.ptr, :int, :dword], :int

    #VOID WINAPI mouse_event(
    #  _In_  DWORD dwFlags,
    #  _In_  DWORD dx,
    #  _In_  DWORD dy,
    #  _In_  DWORD dwData,
    #  _In_  ULONG_PTR dwExtraInfo )
    attach_function 'mouse_event', [MouseEventFlags, :dword, :dword, :dword, :ulong], :void

    #BOOL WINAPI ReleaseCapture(void)
    attach_function 'ReleaseCapture', [], :bool

    #HWND WINAPI SetCapture( _In_  HWND hWnd )
    attach_function 'SetCapture', [:hwnd], :hwnd

    #BOOL WINAPI SetDoubleClickTime( _In_  UINT uInterval )
    attach_function 'SetDoubleClickTime', [:uint], :bool

    #BOOL WINAPI SwapMouseButton( _In_  BOOL fSwap )
    attach_function 'SwapMouseButton', [:bool], :bool

    #BOOL WINAPI TrackMouseEvent( _Inout_  LPTRACKMOUSEEVENT lpEventTrack )
    attach_function 'TrackMouseEvent', [TRACKMOUSEEVENT.ptr], :bool

  end
end