require_relative '../../base'

module WinFFI
  module Gdi32
    FontFamily = enum :font_family, [
        :DONTCARE,   0x00, # Don't care or don't know.
        :ROMAN,      0x10, # Variable stroke width, serifed.
        :SWISS,      0x20, # Variable stroke width, sans-serifed.
        :MODERN,     0x30, # Constant stroke width, serifed or sans-serifed.
        :SCRIPT,     0x40, # Cursive, etc.
        :DECORATIVE, 0x50  # Old English, etc.
    ]

    define_prefix(:FF, FontFamily)
  end
end