module WinFFI
  module User32
    # STICKYKEYS dwFlags field
    StickyKeysFlags = enum :sticky_keys_flags, [
        :STICKYKEYSON,    0x00000001, # If this flag is set, the StickyKeys feature is on.
        :AVAILABLE,       0x00000002, # If this flag is set, the StickyKeys feature is available.
        :HOTKEYACTIVE,    0x00000004, # If this flag is set, the user can turn the StickyKeys feature on and off by
        # pressing the SHIFT key five times.
        :CONFIRMHOTKEY,   0x00000008, # Windows 95/98, Windows 2000: A confirmation dialog appears when the StickyKeys
        # feature is activated by using the hot key.
        :HOTKEYSOUND,     0x00000010, # If this flag is set, the system plays a siren sound when the user turns the
        # StickyKeys feature on or off by using the hot key.
        :INDICATOR,       0x00000020, # Windows 95/98, Windows 2000: A visual indicator should be displayed when the
        # StickyKeys feature is on.
        :AUDIBLEFEEDBACK, 0x00000040, # If this flag is set, the system plays a sound when the user latches, locks, or
        # releases modifier keys using the StickyKeys feature.
        :TRISTATE,        0x00000080, # If this flag is set, pressing a modifier key twice in a row locks down the key
        # until the user presses it a third time.
        :TWOKEYSOFF,      0x00000100, # If this flag is set, releasing a modifier key that has been pressed in
        # combination with any other key turns off the StickyKeys feature.
        :LALTLATCHED,     0x10000000, # Windows 98, Windows 2000: The left ALT key is latched.
        :LCTLLATCHED,     0x04000000, # Windows 98, Windows 2000: The left CTRL key is latched.
        :LSHIFTLATCHED,   0x01000000, # Windows 98, Windows 2000: The left SHIFT key is latched.
        :RALTLATCHED,     0x20000000, # Windows 98, Windows 2000: The right ALT key is latched.
        :RCTLLATCHED,     0x08000000, # Windows 98, Windows 2000: The right CTRL key is latched.
        :RSHIFTLATCHED,   0x02000000, # Windows 98, Windows 2000: The right SHIFT key is latched.
        :LWINLATCHED,     0x40000000, # Windows 98, Windows 2000: The left Windows key is latched.
        :RWINLATCHED,     0x80000000, # Windows 98, Windows 2000: The right Windows key is latched.
        :LALTLOCKED,      0x00100000, # Windows 98, Windows 2000: The left ALT key is locked.
        :LCTLLOCKED,      0x00040000, # Windows 98, Windows 2000: The left CTRL key is locked.
        :LSHIFTLOCKED,    0x00010000, # Windows 98, Windows 2000: The left SHIFT key is locked.
        :RALTLOCKED,      0x00200000, # Windows 98, Windows 2000: The right ALT key is locked.
        :RCTLLOCKED,      0x00080000, # Windows 98, Windows 2000: The right CTRL key is locked.
        :RSHIFTLOCKED,    0x00020000, # Windows 98, Windows 2000: The right SHIFT key is locked.
        :LWINLOCKED,      0x00400000, # Windows 98, Windows 2000: The left Windows key is locked.
        :RWINLOCKED,      0x00800000, # Windows 98, Windows 2000: The right Windows key is locked.
    ]
  end
end