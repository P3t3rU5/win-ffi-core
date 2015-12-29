require 'win-ffi/user32'

module WinFFI
  module User32
    MenuItemInfoFlags = enum :menu_item_info_flags, [
        :STATE,       0x00000001,
        :ID,          0x00000002,
        :SUBMENU,     0x00000004,
        :CHECKMARKS,  0x00000008,
        :TYPE,        0x00000010,
        :DATA,        0x00000020,
        :STRING,      0x00000040,
        :BITMAP,      0x00000080,
        :FTYPE,       0x00000100,
    ]
  end
end
