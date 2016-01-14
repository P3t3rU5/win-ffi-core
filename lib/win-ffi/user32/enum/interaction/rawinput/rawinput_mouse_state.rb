require 'win-ffi/user32'

module WinFFI
  module User32
    # Define the mouse button state indicators.
    buffer = [
        :BUTTON_1_DOWN,
        :LEFT_BUTTON_DOWN,   0x0001,  # Left Button changed to down.
        :BUTTON_1_UP,
        :LEFT_BUTTON_UP,     0x0002,  # Left Button changed to up.
        :BUTTON_2_DOWN,
        :RIGHT_BUTTON_DOWN,  0x0004,  # Right Button changed to down.
        :BUTTON_2_UP,
        :RIGHT_BUTTON_UP,    0x0008,  # Right Button changed to up.
        :BUTTON_3_DOWN,
        :MIDDLE_BUTTON_DOWN, 0x0010,  # Middle Button changed to down.
        :BUTTON_3_UP,
        :MIDDLE_BUTTON_UP,   0x0020,  # Middle Button changed to up.
        :BUTTON_4_DOWN,      0x0040,
        :BUTTON_4_UP,        0x0080,
        :BUTTON_5_DOWN,      0x0100,
        :BUTTON_5_UP,        0x0200,
        # If usButtonFlags has RI_MOUSE_WHEEL, the wheel delta is stored in usButtonData.
        # Take it as a signed value.
        :WHEEL,              0x0400
    ]

    if WindowsVersion >= :vista
      buffer += [:HWHEEL, 0x0800]
    end

    RawInputMouseState = enum :rawinput_mouse_state, buffer
  end
end