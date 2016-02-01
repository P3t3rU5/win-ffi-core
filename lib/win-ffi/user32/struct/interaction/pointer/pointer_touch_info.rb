module WinFFI
  module User32
    if WindowsVersion >= 8

      require 'win-ffi/user32/enum/interaction/touch/touch_mask'

      require 'win-ffi/general/struct/rect'
      require 'win-ffi/user32/struct/interaction/pointer/pointer_info'

      TOUCH_FLAG_NONE = 0x00000000

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
end
