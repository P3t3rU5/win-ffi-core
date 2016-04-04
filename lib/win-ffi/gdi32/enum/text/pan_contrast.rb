require 'win-ffi/gdi32'

module WinFFI
  module Gdi32
    PanContrast = enum :pan_contrast, [
        :ANY,            0, # Any
        :NO_FIT,         1, # No Fit
        :NONE,           2, # None
        :VERY_LOW,       3, # Very Low
        :LOW,            4, # Low
        :MEDIUM_LOW,     5, # Medium Low
        :MEDIUM,         6, # Medium
        :MEDIUM_HIGH,    7, # Mediim High
        :HIGH,           8, # High
        :VERY_HIGH,      9, # Very High
    ]
  end
end