require 'win-ffi/user32'

module WinFFI
  module User32
    TrackMouseEventFlag = enum :track_mouse_event_flag, [
        :HOVER,     0x00000001,
        :LEAVE,     0x00000002,
        :NONCLIENT, 0x00000010,
        :QUERY,     0x40000000,
        :CANCEL,    0x80000000,
    ]
  end
end