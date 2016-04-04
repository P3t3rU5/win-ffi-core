module WinFFI
  module User32
    # MOUSEKEYS dwFlags field
    MouseKeysFlag = enum :mouse_keys_flag, [
        :MOUSEKEYSON,     0x00000001, # If this flag is set, the MouseKeys feature is on.
        :AVAILABLE,       0x00000002, # If this flag is set, the MouseKeys feature is available.
        :HOTKEYACTIVE,    0x00000004, # If this flag is set, the user can turn the MouseKeys feature on and off by using
        # the hot key, which is LEFT ALT+LEFT SHIFT+NUM LOCK.
        :CONFIRMHOTKEY,   0x00000008, # Windows 95/98, Windows 2000: A confirmation dialog box appears when the
        # MouseKeys feature is activated by using the hot key.
        :HOTKEYSOUND,     0x00000010, # If this flag is set, the system plays a siren sound when the user turns the
        # MouseKeys feature on or off by using the hot key.
        :INDICATOR,       0x00000020, # Windows 95/98, Windows 2000: A visual indicator is displayed when the MouseKeys
        # feature is on.
        :MODIFIERS,       0x00000040, # Windows 95/98, Windows 2000: The CTRL key increases cursor speed by the value
        # specified by the iCtrlSpeed member, and the SHIFT key causes the cursor to delay briefly after moving a single
        # pixel, allowing fine positioning of the cursor. If this value is not specified, the CTRL and SHIFT keys are
        # ignored while the user moves the mouse cursor using the arrow keys.
        :REPLACENUMBERS,  0x00000080, # Windows 95/98, Windows 2000: The numeric keypad moves the mouse when the NUM
        # LOCK key is on. If this flag is not specified, the numeric keypad moves the mouse cursor when the NUM LOCK key
        # is off.
        :LEFTBUTTONDOWN,  0x01000000, # Windows 95/98, Windows 2000: The left button is in the "down" state.
        :RIGHTBUTTONDOWN, 0x02000000, # Windows 95/98, Windows 2000: The right button is in the "down" state.
        :LEFTBUTTONSEL,   0x10000000, # Windows 95/98, Windows 2000: The user has selected the left button for
        # mouse-button actions.
        :RIGHTBUTTONSEL,  0x20000000, # Windows 95/98, Windows 2000: The user has selected the right button for
        # mouse-button actions.
        :MOUSEMODE,       0x80000000  # Windows 95/98, Windows 2000: The system is processing numeric keypad input as
        # mouse commands.
    ]
  end
end