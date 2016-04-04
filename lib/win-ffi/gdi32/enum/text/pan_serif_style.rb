require 'win-ffi/gdi32'

module WinFFI
  module Gdi32
    PanSerifStyle = enum :pan_serif_style, [
        :ANY,                 0, # Any
        :NO_FIT,              1, # No Fit
        :COVE,                2, # Cove
        :OBTUSE_COVE,         3, # Obtuse Cove
        :SQUARE_COVE,         4, # Square Cove
        :OBTUSE_SQUARE_COVE,  5, # Obtuse Square Cove
        :SQUARE,              6, # Square
        :THIN,                7, # Thin
        :BONE,                8, # Bone
        :EXAGGERATED,         9, # Exaggerated
        :TRIANGLE,           10, # Triangle
        :NORMAL_SANS,        11, # Normal Sans
        :OBTUSE_SANS,        12, # Obtuse Sans
        :PERP_SANS,          13, # Prep Sans
        :FLARED,             14, # Flared
        :ROUNDED,            15, # Rounded
    ]
  end
end