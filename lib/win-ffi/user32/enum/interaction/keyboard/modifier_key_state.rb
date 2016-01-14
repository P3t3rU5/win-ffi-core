module WinFFI
  module User32
    # Pointer info key states defintions.
    ModifierKeyState = enum :modifier_key_state, [
        :POINTER_MOD_SHIFT, 0x0004, # Shift key is held down.
        :POINTER_MOD_CTRL,  0x0008  # Ctrl key is held down.
    ]
  end
end