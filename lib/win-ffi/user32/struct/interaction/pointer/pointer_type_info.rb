require 'win-ffi/user32/enum/interaction/pointer/pointer_input_type'

require 'win-ffi/user32/struct/interaction/pointer/pointer_touch_info'
require 'win-ffi/user32/struct/interaction/pointer/pointer_pen_info'

module WinFFI
  module User32

    class PTI_UNION < FFI::Union
      layout :touchInfo, POINTER_TOUCH_INFO,
             :penInfo,   POINTER_PEN_INFO
    end

    class POINTER_TYPE_INFO < FFIStruct
      layout :type, PointerInputType,
             :u,    PTI_UNION

    end
  end
end