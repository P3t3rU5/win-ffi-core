require 'win-ffi/user32'

module WinFFI
  module User32
    if WindowsVersion >= 8
      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh969209(v=vs.85).aspx
      PenMask = enum :pen_mask, [
        :NONE,     0x00000000, # Default. None of the optional fields are valid.
        :PRESSURE, 0x00000001, # pressure of the POINTER_PEN_INFO structure is valid.
        :ROTATION, 0x00000002, # rotation of the POINTER_PEN_INFO structure is valid.
        :TILT_X,   0x00000004, # tiltX of the POINTER_PEN_INFO structure is valid.
        :TILT_Y,   0x00000008, # tiltY of the POINTER_PEN_INFO structure is valid.
      ]
    end
  end
end