module WinFFI
  module User32
    # FILTERKEYS dwFlags field
    FilterKeysFlag = enum :filter_keys_flag, [
        :FILTERKEYSON,  0x00000001, # The FilterKeys features are on.
        :AVAILABLE,     0x00000002, # The FilterKeys features are available.
        :HOTKEYACTIVE,  0x00000004, # The user can turn the FilterKeys feature on and off by holding down the RIGHT
        # SHIFT key for eight seconds.
        :CONFIRMHOTKEY, 0x00000008, # Windows 95/98, Windows 2000: A confirmation dialog box appears when the FilterKeys
        # features are activated by using the hot key.
        :HOTKEYSOUND,   0x00000010, # If this flag is set, the computer plays a siren sound when the user turns the
        # FilterKeys feature on or off by using the hot key.
        :INDICATOR,     0x00000020, # Windows 95, Windows 2000: A visual indicator is displayed when the FilterKeys
        # features are on.
        :CLICKON,       0x00000040  # The computer makes a click sound when a key is pressed or accepted. If SlowKeys is
        # on, a click is generated when the key is pressed and again when the keystroke is accepted.
    ]
  end
end