require_relative '../../base'

module WinFFI
  module Gdi32
    buffer = [
        :DEFAULT,        0,
        :DRAFT,          1,
        :PROOF,          2,
        :NONANTIALIASED, 3,
        :ANTIALIASED,    4
    ]

    buffer += [:CLEARTYPE, 5, :CLEARTYPE_NATURAL, 6] if WINDOWS_VERSION >= :xp

    FontQuality = enum FFI::Type::UINT8, :font_quality, buffer

    define_suffix(:QUALITY, FontQuality)
  end
end