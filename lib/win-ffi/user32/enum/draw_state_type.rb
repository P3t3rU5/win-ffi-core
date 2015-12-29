require 'win-ffi/user32'

module WinFFI
  module User32
    # Image type
    DrawStateType = enum :draw_state_type, [
      :COMPLEX,    0x0000,
      :TEXT,       0x0001,
      :PREFIXTEXT, 0x0002,
      :ICON,       0x0003,
      :BITMAP,     0x0004
    ]
  end
end