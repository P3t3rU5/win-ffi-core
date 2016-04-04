module WinFFI
  module User32
    # flags for HIGHCONTRAST dwFlags field
    HighContrastFlag = enum :high_constrast_flag, [
        :HIGHCONTRASTON,  0x00000001, # The high contrast feature is on.
        :AVAILABLE,       0x00000002, # The high contrast feature is available.
        :HOTKEYACTIVE,    0x00000004, # The user can turn the high contrast feature on and off by simultaneously
        # pressing the left ALT, left SHIFT, and PRINT SCREEN keys.
        :CONFIRMHOTKEY,   0x00000008, # A confirmation dialog appears when the high contrast feature is activated by
        # using the hot key.
        :HOTKEYSOUND,     0x00000010, # A siren is played when the user turns the high contrast feature on or off by
        # using the hot key.
        :INDICATOR,       0x00000020, # A visual indicator is displayed when the high contrast feature is on. This
        # value is not currently used and is ignored.
        :HOTKEYAVAILABLE, 0x00000040, # The hot key associated with the high contrast feature can be enabled. An
        # application can retrieve this value, but cannot set it.
        :LOGONDESKTOP,    0x00000100, #
        :DEFAULTDESKTOP,  0x00000200  #
    ]
  end
end