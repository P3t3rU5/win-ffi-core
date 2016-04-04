require 'win-ffi/gdi32'

module WinFFI
  module Gdi32
    PanMidline = enum :pan_midline, [
        :ANY,               0, # Any
        :NO_FIT,            1, # No Fit
        :STANDARD_TRIMMED,  2, # Standard/Trimmed
        :STANDARD_POINTED,  3, # Standard/Pointed
        :STANDARD_SERIFED,  4, # Standard/Serifed
        :HIGH_TRIMMED,      5, # High/Trimmed
        :HIGH_POINTED,      6, # High/Pointed
        :HIGH_SERIFED,      7, # High/Serifed
        :CONSTANT_TRIMMED,  8, # Constant/Trimmed
        :CONSTANT_POINTED,  9, # Constant/Pointed
        :CONSTANT_SERIFED, 10, # Constant/Serifed
        :LOW_TRIMMED,      11, # Low/Trimmed
        :LOW_POINTED,      12, # Low/Pointed
        :LOW_SERIFED,      13, # Low/Serifed
    ]
  end
end