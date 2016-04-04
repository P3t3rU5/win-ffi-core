require 'win-ffi/user32'

module WinFFI
  module User32
    # Touch input flag values (TOUCHINPUT.dwFlags)
    TouchEventFlag = enum :touch_event_flag, [
        :MOVE,       0x0001,
        :DOWN,       0x0002,
        :UP,         0x0004,
        :INRANGE,    0x0008,
        :PRIMARY,    0x0010,
        :NOCOALESCE, 0x0020,
        :PEN,        0x0040,
        :PALM,       0x0080,
    ]
  end
end