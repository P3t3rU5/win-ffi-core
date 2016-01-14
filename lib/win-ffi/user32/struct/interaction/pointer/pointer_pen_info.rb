require 'win-ffi/user32/enum/interaction/pen_flags'
require 'win-ffi/user32/enum/interaction/pen_mask'

require 'win-ffi/user32/struct/interaction/pointer_info'

module WinFFI
  module User32
    if WindowsVersion >= 8
      class POINTER_PEN_INFO < FFIStruct
        layout :pointerInfo, POINTER_INFO,
               :penFlags,    PenFlags,
               :penMask,     PenMask,
               :pressure,    :uint32,
               :rotation,    :uint32,
               :tiltX,       :int32,
               :tiltY,       :int32
      end
    end
  end
end
