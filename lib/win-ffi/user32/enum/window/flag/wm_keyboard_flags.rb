module WinFFI
  module User32
    # WM_KEYUP/DOWN/CHAR HIWORD(lParam) flags
    KeyboardMessageFlags = enum :keyboard_message_flags, [
        :EXTENDED, 0x0100,
        :DLGMODE,  0x0800,
        :MENUMODE, 0x1000,
        :ALTDOWN,  0x2000,
        :REPEAT,   0x4000,
        :UP,       0x8000
    ]
  end
end