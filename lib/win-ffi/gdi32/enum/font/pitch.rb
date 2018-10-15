require_relative '../../base'

module WinFFI
  module Gdi32
    FontPitch = enum FFI::Type::UINT8, :font_pitch, [
        :DEFAULT,           0x00,
        :FIXED,             0x01,
        :VARIABLE,          0x02,
        :MONO_FONT,         0x08,
    ]

    define_suffix(:PITCH, FontPitch)
  end
end