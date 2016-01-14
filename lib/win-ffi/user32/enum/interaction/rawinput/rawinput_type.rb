require 'win-ffi/user32'

module WinFFI
  module User32
    # Type of the raw input
    RawInputType = enum :rawinput_type, [
      :TYPEMOUSE,    0, # The device is a mouse.
      :TYPEKEYBOARD, 1, # The device is a keyboard.
      :TYPEHID,      2  # The device is an HID that is not a keyboard and not a mouse.
    ]
  end
end