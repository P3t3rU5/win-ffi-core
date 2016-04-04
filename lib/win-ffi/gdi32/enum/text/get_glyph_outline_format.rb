module WinFFI
  module Gdi32

    # GetGlyphOutline constants
    GetGlyphOutlineFormat = enum :get_glyph_outline_format, [
        :METRICS,          0,
        :BITMAP,           1,
        :NATIVE,           2,
        :BEZIER,           3,

        :GRAY2_BITMAP,     4,
        :GRAY4_BITMAP,     5,
        :GRAY8_BITMAP,     6,
        :GLYPH_INDEX, 0x0080,

        :UNHINTED,    0x0100
    ]
  end
end