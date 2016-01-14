require 'win-ffi/user32'

module WinFFI
  module User32
    if WindowsVersion >= 8
      TouchHitTesting = enum :touch_hit_testing, [
          :DEFAULT, 0x0,
          :CLIENT,  0x1,
          :NONE,    0x2
      ]
    end
  end
end