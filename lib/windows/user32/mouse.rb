module WinFFI
  module User32
    module Mouse
      extend LibBase
      ffi_lib 'user32'

      MouseEventFlags = enum :mouse_event_flags, [
          :MOVE, 0x0001, # Movement occurred.
          :LEFTDOWN, 0x0002, # The left button is down.
          :LEFTUP, 0x0004, # The left button is up.
          :RIGHTDOWN, 0x0008, # The right button is down.
          :RIGHTUP, 0x0010, # The right button is up.
          :MIDDLEDOWN, 0x0020, # The middle button is down.
          :MIDDLEUP, 0x0040, # The middle button is up.
          :XDOWN, 0x0080, # An X button was pressed.
          :XUP, 0x0100, # An X button was released.
          :WHEEL, 0x0800, # The wheel has been moved, if the mouse has a wheel. The amount of movement is specified in
          # dwData, # The wheel button is rotated.
          :HWHEEL, 0x01000, # The wheel button is tilted.
          :ABSOLUTE, 0x8000, # The dx and dy parameters contain normalized absolute coordinates. If not set, those
                             # parameters contain relative data: the change in position since the last reported position. This flag can be
                             # set, or not set, regardless of what kind of mouse or mouse-like device, if any, is connected to the system.
                             # For further information about relative mouse motion, see the following Remarks section.
      ]

      MouseKeysFlags = enum :mouse_keys_flags, [
          :ctrl,     0x0008, #The CTRL key is down.
          :lbutton,  0x0001, #The left mouse button is down.
          :mbutton,  0x0010, #The middle mouse button is down.
          :rbutton,  0x0002, #The right mouse button is down.
          :shift,    0x0004, #The SHIFT key is down.
          :xbutton1, 0x0020, #The first X button is down.
          :xbutton2, 0x0040  #The second X button is down.
      ]

      class MOUSEMOVEPOINT < FFI::Struct
        layout :x,           :int,
               :y,           :int,
               :time,        :dword,
               :dwExtraInfo, :ulong
      end


      class TRACKMOUSEEVENT < FFI::Struct
        layout :cbSize,      :dword,
               :dwFlags,     :dword,
               :hwndTrack,   :hwnd,
               :dwHoverTime, :dword
      end

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
      #attach_function 'mouse_event', [MouseEventFlags, :dword, :dword, :dword, :ulong], :void

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
end