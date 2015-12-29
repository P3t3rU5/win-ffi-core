require 'win-ffi/gdi32/struct/bitmap_info_header'
require 'win-ffi/gdi32/struct/rgb_quad'

module WinFFI
  module Gdi32
    class BITMAPINFO < FFIStruct
      layout :bmiHeader, BITMAPINFOHEADER,
             :bmiColors, RGBQUAD
    end
  end
end