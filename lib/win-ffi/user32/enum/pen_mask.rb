require 'win-ffi/user32'

module WinFFI
  module User32
    PenMask = enum :pen_mask,
    [
      :PEN_MASK_NONE,     0x00000000, # Default. None of the optional fields are valid.
      :PEN_MASK_PRESSURE, 0x00000001, # pressure of the POINTER_PEN_INFO structure is valid.
      :PEN_MASK_ROTATION, 0x00000002, # rotation of the POINTER_PEN_INFO structure is valid.
      :PEN_MASK_TILT_X,   0x00000004, # tiltX of the POINTER_PEN_INFO structure is valid.
      :PEN_MASK_TILT_Y,   0x00000008, # tiltY of the POINTER_PEN_INFO structure is valid.
    ]
  end
end