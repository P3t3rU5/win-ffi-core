module WinFFI
  module User32
    AppendMenuFlags = enum :append_menu_flags,
    [
      :UNCHECKED,    0x00000000,
      :STRING,       0x00000000,
      :ENABLED,      0x00000000,
      :GRAYED,       0x00000001,
      :DISABLED,     0x00000002,
      :BITMAP,       0x00000004,
      :CHECKED,      0x00000008,
      :POPUP,        0x00000010,
      :MENUBARBREAK, 0x00000020,
      :MENUBREAK,    0x00000040,
      :OWNERDRAW,    0x00000100,
      :SEPARATOR,    0x00000800
    ]
  end
end