require 'win-ffi/user32/enum/touch_mask'

require 'win-ffi/general/struct/rect'
require 'win-ffi/user32/struct/pointer_info'

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
