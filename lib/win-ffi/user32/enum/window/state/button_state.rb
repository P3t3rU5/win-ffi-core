require 'win-ffi/user32'

module WinFFI
  module User32
    ButtonState = enum :button_state, [
        :UNCHECKED,     0x0000,
        :CHECKED,       0x0001,
        :INDETERMINATE, 0x0002,
        :PUSHED,        0x0004,
        :FOCUS,         0x0008
    ]
  end
end