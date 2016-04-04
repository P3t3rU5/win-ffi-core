require 'win-ffi/user32'

module WinFFI
  module User32
    # Border flags
    BorderFlag = enum :border_flag,
    [
      :LEFT,                    0x0001,
      :TOP,                     0x0002,
      :TOPLEFT,                 0x0003,
      :RIGHT,                   0x0004,
      :TOPRIGHT,                0x0006,
      :BOTTOM,                  0x0008,
      :BOTTOMLEFT,              0x0009,
      :DIAGONAL,                0x0010,
      :BOTTOMRIGHT,             0x0012,
      :RECT,                    0x0015,
      :DIAGONAL_ENDTOPLEFT,     0x0019,
      :DIAGONAL_ENDTOPRIGHT,    0x0022,
      :DIAGONAL_ENDBOTTOMLEFT,  0x0025,
      :DIAGONAL_ENDBOTTOMRIGHT, 0x0028,
      :MIDDLE,                  0x0800, # Fill in the middle
      :SOFT,                    0x1000, # For softer buttons
      :ADJUST,                  0x2000, # Calculate the space left over
      :FLAT,                    0x4000, # For flat rather than 3D borders
      :MONO,                    0x8000 # For monochrome borders
    ]
  end
end