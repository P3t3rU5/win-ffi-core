require 'win-ffi/user32/enum/accessibility/flag/toggle_keys_flags'

module WinFFI
  module User32
    # TOGGLEKEYS dwFlags field
    ToggleKeysFlags = enum :toggle_keys_flags, [
        :TOGGLEKEYSON,  0x00000001,
        :AVAILABLE,     0x00000002,
        :HOTKEYACTIVE,  0x00000004,
        :CONFIRMHOTKEY, 0x00000008,
        :HOTKEYSOUND,   0x00000010,
        :INDICATOR,     0x00000020,
    ]
  end
end