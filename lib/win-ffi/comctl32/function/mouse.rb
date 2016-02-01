require 'win-ffi/comctl32'

require 'win-ffi/user32/struct/interaction/mouse/track_mouse_event'

module WinFFI
  module Comctl32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646266(v=vs.85).aspx
    # BOOL WINAPI _TrackMouseEvent(
    #   _Inout_  LPTRACKMOUSEEVENT lpEventTrack )
    attach_function '_TrackMouseEvent', [User32::TRACKMOUSEEVENT.ptr], :bool
  end
end

