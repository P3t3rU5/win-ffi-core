require 'win-ffi/gdi32'

module WinFFI
  module Gdi32
    buffer = [
      :OPAQUE,         0x0002,
      :CLIPPED,        0x0004,
      :GLYPH_INDEX,    0x0010,
      :RTLREADING,     0x0080,
      :NUMERICSLOCAL,  0x0400,
      :NUMERICSLATIN,  0x0800,
      :IGNORELANGUAGE, 0x1000,
      :PDY,            0x2000,
    ]

    if WindowsVersion >= :vista
      buffer += [:REVERSE_INDEX_MAP, 0x10000]
    end

    ExtTextOutFlag = enum :ext_text_out_text, buffer
  end
end