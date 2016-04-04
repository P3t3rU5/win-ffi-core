require 'win-ffi/user32/enum/interaction/mouse/track_mouse_event_flag'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645604(v=vs.85).aspx
    class TRACKMOUSEEVENT < FFIStruct
      layout :cbSize,      :dword,
             :dwFlags,     TrackMouseEventFlag,
             :hwndTrack,   :hwnd,
             :dwHoverTime, :dword

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end