require 'win-ffi/user32'

module WinFFI
  module User32
    if WindowsVersion >= 7
      # Gesture flags - GESTUREINFO.dwFlags
      GestureFlag = enum :gesture_flag, [
          :BEGIN,   0x00000001,
          :INERTIA, 0x00000002,
          :END,     0x00000004
      ]
    end
  end
end