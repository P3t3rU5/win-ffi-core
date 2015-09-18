require 'win-ffi/enums/user32/pen_flags'
require 'win-ffi/enums/user32/pen_mask'

require 'win-ffi/structs/user32/pointer_info'

module WinFFI
  module User32
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
