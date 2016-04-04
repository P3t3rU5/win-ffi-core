module WinFFI
  module User32
    # Low level hook flags
    LowLevelKeyboardHookFlag = enum :low_level_keyboard_hook_flag, [
        :EXTENDED,          0x00000001,
        :LOWER_IL_INJECTED, 0x00000002,
        :INJECTED,          0x00000010,
        :ALTDOWN,           0x00000020,
        :UP,                0x00000080
    ]
  end
end