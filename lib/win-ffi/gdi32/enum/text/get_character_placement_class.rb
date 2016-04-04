module WinFFI
  module Gdi32
    GetCharacterPlacementClass = enum :get_character_placement_class, [
        :LATIN,                  1,
        :HEBREW,                 2,
        :ARABIC,                 2,
        :NEUTRAL,                3,
        :LOCALNUMBER,            4,
        :LATINNUMBER,            5,
        :LATINNUMERICTERMINATOR, 6,
        :LATINNUMERICSEPARATOR,  7,
        :NUMERICSEPARATOR,       8,
        :PREBOUNDLTR,         0x80,
        :PREBOUNDRTL,         0x40,
        :POSTBOUNDLTR,        0x20,
        :POSTBOUNDRTL,        0x10
    ]
  end
end