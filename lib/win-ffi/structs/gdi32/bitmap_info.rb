require_relative 'bitmap_info_header'
require_relative 'rgb_quad'

module WinFFI
  module Gdi32
    class BITMAPINFO < FFIStruct
      layout :bmiHeader, BITMAPINFOHEADER,
             :bmiColors, RGBQUAD
    end
  end
end