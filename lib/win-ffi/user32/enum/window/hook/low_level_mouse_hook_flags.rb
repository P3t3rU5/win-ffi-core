module WinFFI
  module User32
    # Low level hook flags
    LowLevelMouseHookFlags = enum :low_level_mouse_hook_flags, [
        :INJECTED,          0x00000001,
        :LOWER_IL_INJECTED, 0x00000002
    ]
  end
end