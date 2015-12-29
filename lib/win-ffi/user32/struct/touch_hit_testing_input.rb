require 'win-ffi/general/struct/point'
require 'win-ffi/general/struct/rect'

module WinFFI
  module User32
    class TOUCH_HIT_TESTING_INPUT < FFIStruct
      layout :pointerId,              :uint32,
             :point,                  POINT,
             :boundingBox,            RECT,
             :nonOccludedBoundingBox, RECT,
             :orientation,            :uint32
    end
  end
end