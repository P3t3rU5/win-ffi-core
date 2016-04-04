module WinFFI
  module Gdi32
    GetCharacterPlacementFlag = enum :get_character_placement, [
        :DBCS,           0x0001,
        :REORDER,        0x0002,
        :USEKERNING,     0x0008,
        :GLYPHSHAPE,     0x0010,
        :LIGATE,         0x0020,
        # :GLYPHINDEXING,  0x0080,
        :DIACRITIC,      0x0100,
        :KASHIDA,        0x0400,
        :ERROR,          0x8000,
        :FLI_MASK,       0x103B,

        :JUSTIFY,        0x00010000,
        # :NODIACRITICS,   0x00020000,
        :FLI_GLYPHS,      0x00040000,
        :CLASSIN,         0x00080000,
        :MAXEXTENT,       0x00100000,
        :JUSTIFYIN,       0x00200000,
        :DISPLAYZWG,      0x00400000,
        :SYMSWAPOFF,      0x00800000,
        :NUMERICOVERRIDE, 0x01000000,
        :NEUTRALOVERRIDE, 0x02000000,
        :NUMERICSLATIN,   0x04000000,
        :NUMERICSLOCAL,   0x08000000,
    ]
  end
end