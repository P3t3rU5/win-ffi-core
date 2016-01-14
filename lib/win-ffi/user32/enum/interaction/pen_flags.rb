require 'win-ffi/user32'

module WinFFI
  module User32
    if WindowsVersion >= 8
      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh969208(v=vs.85).aspx
      PenFlags = enum :pen_flags, [
          :NONE,     0x00000000,
          :BARREL,   0x00000001, # The barrel button is pressed.
          :INVERTED, 0x00000002, # The pen is inverted.
          :ERASER,   0x00000004, # The eraser button is pressed.
      ]
    end
  end
end