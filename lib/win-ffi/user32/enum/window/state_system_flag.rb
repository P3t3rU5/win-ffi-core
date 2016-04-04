module WinFFI
  module User32
    if WindowsVersion >= :vista
      StateSystemFlag = enum :state_system_flag, [
          :UNAVAILABLE,     0x00000001, # Disabled; The element is unavailable.
          :SELECTED,        0x00000002,
          :FOCUSED,         0x00000004,
          :PRESSED,         0x00000008, # The element is in the pressed state.
          :CHECKED,         0x00000010,
          :MIXED,           0x00000020, # 3-state checkbox or toolbar button
          :INDETERMINATE,   0x00000020,
          :READONLY,        0x00000040,
          :HOTTRACKED,      0x00000080,
          :DEFAULT,         0x00000100,
          :EXPANDED,        0x00000200,
          :COLLAPSED,       0x00000400,
          :BUSY,            0x00000800,
          :FLOATING,        0x00001000, # Children "owned" not "contained" by parent
          :MARQUEED,        0x00002000,
          :ANIMATED,        0x00004000,
          :INVISIBLE,       0x00008000, # The element is invisible.
          :OFFSCREEN,       0x00010000, # The element has no visible representation.
          :SIZEABLE,        0x00020000,
          :MOVEABLE,        0x00040000,
          :SELFVOICING,     0x00080000,
          :FOCUSABLE,       0x00100000, # The element can accept the focus.
          :SELECTABLE,      0x00200000,
          :LINKED,          0x00400000,
          :TRAVERSED,       0x00800000,
          :MULTISELECTABLE, 0x01000000, # Supports multiple selection
          :EXTSELECTABLE,   0x02000000, # Supports extended selection
          :ALERT_LOW,       0x04000000, # This information is of low priority
          :ALERT_MEDIUM,    0x08000000, # This information is of medium priority
          :ALERT_HIGH,      0x10000000, # This information is of high priority
          :PROTECTED,       0x20000000, # access to this is restricted
          :VALID,           0x3FFFFFFF,
      ]
    end
  end
end