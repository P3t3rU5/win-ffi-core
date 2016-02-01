require 'win-ffi/user32'

require 'win-ffi/user32/enum/interaction/mouse/mouse_keys_state'
require 'win-ffi/user32/enum/interaction/mouse/mouse_event_flags'

require 'win-ffi/general/struct/point'
require 'win-ffi/user32/struct/interaction/mouse/mouse_move_point'
require 'win-ffi/user32/struct/interaction/mouse/track_mouse_event'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646256(v=vs.85).aspx
    # BOOL WINAPI DragDetect(
    #   _In_  HWND hwnd,
    #   _In_  POINT pt )
    attach_function 'DragDetect', [:hwnd, POINT.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646257(v=vs.85).aspx
    # HWND WINAPI GetCapture(void)
    attach_function 'GetCapture', [], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646258(v=vs.85).aspx
    # UINT WINAPI GetDoubleClickTime(void)
    attach_function 'GetDoubleClickTime', [:void], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646259(v=vs.85).aspx
    # int WINAPI GetMouseMovePointsEx(
    #   _In_   UINT cbSize,
    #   _In_   LPMOUSEMOVEPOINT lppt,
    #   _Out_  LPMOUSEMOVEPOINT lpptBuf,
    #   _In_   int nBufPoints,
    #   _In_   DWORD resolution )
    attach_function 'GetMouseMovePointsEx', [:uint, MOUSEMOVEPOINT.ptr, :pointer, :int, :dword], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646260(v=vs.85).aspx
    # VOID WINAPI mouse_event(
    #   _In_  DWORD dwFlags,
    #   _In_  DWORD dx,
    #   _In_  DWORD dy,
    #   _In_  DWORD dwData,
    #   _In_  ULONG_PTR dwExtraInfo )
    attach_function 'mouse_event', [MouseEventFlags, :dword, :dword, :dword, :ulong], :void

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646261(v=vs.85).aspx
    # BOOL WINAPI ReleaseCapture(void)
    attach_function 'ReleaseCapture', [], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646262(v=vs.85).aspx
    # HWND WINAPI SetCapture( _In_  HWND hWnd )
    attach_function 'SetCapture', [:hwnd], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646263(v=vs.85).aspx
    # BOOL WINAPI SetDoubleClickTime( _In_  UINT uInterval )
    attach_function 'SetDoubleClickTime', [:uint], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646264(v=vs.85).aspx
    # BOOL WINAPI SwapMouseButton( _In_  BOOL fSwap )
    attach_function 'SwapMouseButton', [:bool], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646265(v=vs.85).aspx
    # BOOL WINAPI TrackMouseEvent( _Inout_  LPTRACKMOUSEEVENT lpEventTrack )
    attach_function 'TrackMouseEvent', [TRACKMOUSEEVENT.ptr], :bool
  end
end