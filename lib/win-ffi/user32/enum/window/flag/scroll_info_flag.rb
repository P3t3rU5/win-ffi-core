module WinFFI
  module User32
    ScrollInfoFlag = enum :scroll_info_flag, [
        :RANGE,           0x0001,
        :PAGE,            0x0002,
        :POS,             0x0004,
        :DISABLENOSCROLL, 0x0008,
        :TRACKPOS,        0x0010,
        :ALL,             0x0017 # :RANGE | :PAGE | :POS | :TRACKPOS
    ]
  end
end