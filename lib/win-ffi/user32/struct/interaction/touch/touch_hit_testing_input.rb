require 'win-ffi/general/struct/point'
require 'win-ffi/general/struct/rect'

module WinFFI
  module User32
    if WindowsVersion >= 8
      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh437254(v=vs.85).aspx
      # WM_TOUCHHITTESTING structure
      class TOUCH_HIT_TESTING_INPUT < FFIStruct
        layout :pointerId,              :uint32,
               :point,                  POINT,
               :boundingBox,            RECT,
               :nonOccludedBoundingBox, RECT,
               :orientation,            :uint32
      end
    end
  end
end