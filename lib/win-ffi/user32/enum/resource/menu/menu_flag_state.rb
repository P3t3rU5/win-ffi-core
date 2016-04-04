require 'win-ffi/user32'

module WinFFI
  module User32
    MenuFlagState = enum :menu_flag_state, [
        :GRAYED,    0x00000003,
        :DISABLED,  0x00000003,
        :CHECKED,   0x00000008,
        :HILITE,    0x00000080,
        :ENABLED,   0x00000000,
        :UNCHECKED, 0x00000000,
        :UNHILITE,  0x00000000,
        :DEFAULT,   0x00001000
    ]
  end
end