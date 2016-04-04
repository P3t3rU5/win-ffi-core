require 'win-ffi/gdi32'

module WinFFI
  module Gdi32
    PanWeight = enum :pan_weight, [
        :ANY,         0, # Any
        :NO_FIT,      1, # No Fit
        :VERY_LIGHT,  2, # Very Light
        :LIGHT,       3, # Light
        :THIN,        4, # Thin
        :BOOK,        5, # Book
        :MEDIUM,      6, # Medium
        :DEMI,        7, # Demi
        :BOLD,        8, # Bold
        :HEAVY,       9, # Heavy
        :BLACK,      10, # Black
        :NORD,       11, # Nord
    ]
  end
end