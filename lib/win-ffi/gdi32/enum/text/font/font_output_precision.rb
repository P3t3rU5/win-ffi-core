require 'win-ffi/gdi32'

module WinFFI
  module Gdi32
    FontOutputPrecision = enum FFI::Type::UINT8, :font_output_precision, [
        :DEFAULT,         0,
        :STRING,          1,
        :CHARACTER,       2,
        :STROKE,          3,
        :TT,              4,
        :DEVICE,          5,
        :RASTER,          6,
        :TT_ONLY,         7,
        :OUTLINE,         8,
        :SCREEN_OUTLINE,  9,
        :PS_ONLY,        10
    ]
  end
end