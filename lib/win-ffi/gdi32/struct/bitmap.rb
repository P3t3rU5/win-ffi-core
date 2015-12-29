require 'win-ffi/gdi32'

module WinFFI
  module Gdi32
    class BITMAP < FFIStruct
      layout :bmType,       :long,
             :bmWidth,      :long,
             :bmHeight,     :long,
             :bmWidthBytes, :long,
             :bmPlanes,     :word,
             :bmBitsPixel,  :word,
             :bmBits,       :pointer
    end
  end
end