require 'win-ffi/enums/gdi32'

module WinFFI
  module Gdi32
    HatchStyles = enum :hatch_styles,
    [
      :HORIZONTAL, 0, # -----
      :VERTICAL,   1, # |||||
      :FDIAGONAL,  2, # \\\\\
      :BDIAGONAL,  3, # /////
      :CROSS,      4, # +++++
      :DIAGCROSS,  5, # xxxxx
    ]
  end
end