require 'win-ffi/user32'

module WinFFI
  module User32
    KeyboardModifier = enum :keyboard_modifier,
    [
      :alt,      0x0001, #Either ALT key must be held down.
      :control,  0x0002, #Either CTRL key must be held down.
      :ctrl,     0x0002,
      :norepeat, 0x4000, #Changes the hotkey behavior so that the keyboard auto-repeat does not yield multiple hotkey notifications.
      #Windows Vista and Windows XP/2000:  This flag is not supported.
      :shift,    0x0004, #Either SHIFT key must be held down.
      :windows,  0x0008, #Either WINDOWS key was held down. These keys are labeled with the Windows logo. Keyboard shortcuts that involve the WINDOWS key are reserved for use by the operating system.
    ]
  end
end