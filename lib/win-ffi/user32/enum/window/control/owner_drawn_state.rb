module WinFFI
  module User32
    # Owner draw state
    OwnerDrawnState = enum :owner_drawn_state, [
        :SELECTED,     0x0001,
        :GRAYED,       0x0002,
        :DISABLED,     0x0004,
        :CHECKED,      0x0008,
        :FOCUS,        0x0010,
        :DEFAULT,      0x0020,
        :COMBOBOXEDIT, 0x1000,
        :HOTLIGHT,     0x0040,
        :INACTIVE,     0x0080,
        :NOACCEL,      0x0100,
        :NOFOCUSRECT,  0x0200,
    ]
  end
end