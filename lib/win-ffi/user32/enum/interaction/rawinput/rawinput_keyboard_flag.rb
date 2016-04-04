require 'win-ffi/user32'

module WinFFI
  module User32
    # Define the keyboard input data Flags.
    RawInputKeybpardFlag = enum :raw_input_keybpard_flag, [
        :MAKE,            0x00,
        :BREAK,           0x01,
        :E0,              0x02,
        :E1,              0x04,
        :TERMSRV_SET_LED, 0x08,
        :TERMSRV_SHADOW,  0x10
    ]
  end
end