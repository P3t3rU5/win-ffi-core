module WinFFI
  module User32
    EnableScrollBarFlag = enum :enable_scrollbar_flag, [
        :ENABLE_BOTH,   0x0000,
        :DISABLE_BOTH,  0x0003,

        :DISABLE_LTUP,
        :DISABLE_LEFT,  0x0001,
        :DISABLE_RTDN,
        :DISABLE_RIGHT, 0x0002,

        :DISABLE_UP,    0x0001,
        :DISABLE_DOWN,  0x0002,
    ]
  end
end