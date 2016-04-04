require 'win-ffi/gdi32'

module WinFFI
  module Gdi32
    FontFamilyPitch = enum FFI::Type::UINT8, :font_family_pitch, [
        :FAMILY_DONTCARE,   0x00, # Don't care or don't know.
        :DEFAULT,           0x00,
        :FIXED,             0x01,
        :VARIABLE,          0x02,
        :MONO_FONT,         0x08,
        :FAMILY_ROMAN,      0x10, # Variable stroke width, serifed.
        :FAMILY_SWISS,      0x20, # Variable stroke width, sans-serifed.
        :FAMILY_MODERN,     0x30, # Constant stroke width, serifed or sans-serifed.
        :FAMILY_SCRIPT,     0x40, # Cursive, etc.
        :FAMILY_DECORATIVE, 0x50  # Old English, etc.
    ]
  end
end