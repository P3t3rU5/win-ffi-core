require 'win-ffi/gdi32'

module WinFFI
  module Gdi32
    buffer = [
        :DEFAULT,   0x00,
        :CHARACTERS, 0x01,
        :STROKE_PRECIS,    0x02,
        :LH_ANGLES,        0x10,
        :TT_ALWAYS,        0x20,
        :EMBEDDED,         0x80,
        :MASK,             0x0f
    ]

    buffer += [:DFA_DISABLE, 0x40,] if WindowsVersion >= :vista

    FontClipPrecision = enum FFI::Type::UINT8, :font_clip_precision, buffer
  end
end