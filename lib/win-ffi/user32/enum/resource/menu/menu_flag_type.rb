require 'win-ffi/user32'

module WinFFI
  module User32
    MenuFlagType = enum :menu_flag_type, [
        :STRING,       0x00000000,
        :BITMAP,       0x00000004,
        :MENUBARBREAK, 0x00000020,
        :MENUBREAK,    0x00000040,
        :OWNERDRAW,    0x00000100,
        :RADIOCHECK,   0x00000200,
        :SEPARATOR,    0x00000800,
        :RIGHTORDER,   0x00002000,
        :RIGHTJUSTIFY, 0x00004000
    ]
  end
end