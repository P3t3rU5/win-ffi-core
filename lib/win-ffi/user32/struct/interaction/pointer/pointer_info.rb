require 'win-ffi/user32/enum/interaction/pointer/pointer_flag'
require 'win-ffi/user32/enum/interaction/pointer/pointer_input_type'
require 'win-ffi/user32/enum/interaction/pointer/pointer_button_change_type'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/hh454907(v=vs.85).aspx
    class POINTER_INFO < FFIStruct
      layout :pointerType,           PointerInputType,
             :pointerId,             :uint32,
             :frameId,               :uint32,
             :pointerFlags,          PointerFlag,
             :sourceDevice,          :handle,
             :hwndTarget,            :hwnd,
             :ptPixelLocation,       POINT,
             :ptHimetricLocation,    POINT,
             :ptPixelLocationRaw,    POINT,
             :ptHimetricLocationRaw, POINT,
             :dwTime,                :dword,
             :historyCount,          :uint32,
             :inputData,             :int32,
             :dwKeyStates,           :dword,
             :PerformanceCount,      :uint,
             :ButtonChangeType,      PointerButtonChangeType
    end
  end
end