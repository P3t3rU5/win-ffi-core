require 'win-ffi/user32'

module WinFFI
  module User32
    if WindowsVersion >= 7
      # Gesture IDs
      GestureIdentifier = enum :gesture_identifier, [
          :BEGIN,        1,
          :END,          2,
          :ZOOM,         3,
          :PAN,          4,
          :ROTATE,       5,
          :TWOFINGERTAP, 6,
          :PRESSANDTAP,  7,
          :ROLLOVER,     7
      ]
    end
  end
end
