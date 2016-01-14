module WinFFI
  module User32
    MenuStyle = enum :menu_style, [
        :NOCHECK,     0x80000000,
        :MODELESS,    0x40000000,
        :DRAGDROP,    0x20000000,
        :AUTODISMISS, 0x10000000,
        :NOTIFYBYPOS, 0x08000000,
        :CHECKORBMP,  0x04000000,
    ]
  end
end