require 'win-ffi/structs/gdi32/bitmap_info_header'
require 'win-ffi/structs/gdi32/rgb_quad'

module WinFFI
  module Gdi32
    class BITMAPINFO < FFIStruct
      layout :bmiHeader, BITMAPINFOHEADER,
             :bmiColors, RGBQUAD
    end
  end
end