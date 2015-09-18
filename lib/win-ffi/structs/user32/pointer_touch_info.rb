require 'win-ffi/enums/user32/touch_mask'

require 'win-ffi/structs/rect'
require 'win-ffi/structs/user32/pointer_info'

module WinFFI
  module User32
    class POINTER_TOUCH_INFO < FFIStruct
      layout :pointerInfo,  POINTER_INFO,
             :touchFlags,   :int,
             :touchMask,    TouchMask,
             :rcContact,    RECT,
             :rcContactRaw, RECT,
             :orientation,  :uint32,
             :pressure,     :uint32
    end
  end
end
