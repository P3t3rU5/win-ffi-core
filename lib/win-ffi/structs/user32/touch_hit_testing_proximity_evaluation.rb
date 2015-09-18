require 'win-ffi/structs/point'

module WinFFI
  module User32
    class TOUCH_HIT_TESTING_PROXIMITY_EVALUATION < FFIStruct
      layout :score,         :uint16,
             :adjustedPoint, POINT
    end
  end
end