require 'win-ffi/gdi32'

module WinFFI
  module Gdi32
    PanStrokeVariation = enum :pan_stroke_variation, [
        :ANY,          0, # Any
        :NO_FIT,       1, # No Fit
        :GRADUAL_DIAG, 2, # Gradual/Diagonal
        :GRADUAL_TRAN, 3, # Gradual/Transitional
        :GRADUAL_VERT, 4, # Gradual/Vertical
        :GRADUAL_HORZ, 5, # Gradual/Horizontal
        :RAPID_VERT,   6, # Rapid/Vertical
        :RAPID_HORZ,   7, # Rapid/Horizontal
        :INSTANT_VERT, 8, # Instant/Vertical
    ]
  end
end