require 'win-ffi/general/struct/rect'

module WinFFI
  module Comctl32
    class IMAGEINFO < FFIStruct
      layout :hbmImage, :hbitmap,
             :hbmMask,  :hbitmap,
             :Unused1,  :int,
             :Unused2,  :int,
             :rcImage,  RECT
    end
  end
end