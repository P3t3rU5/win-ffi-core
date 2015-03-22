require_relative '../../enums/user32/pointer_input_type'
require_relative '../../enums/user32/pointer_flags'

module WinFFI
  module User32
    class POINTER_INFO < FFIStruct
      layout :pointerType,           PointerInputType,
             :pointerId,             :uint32,
             :frameId,               :uint32,
             :pointerFlags,          PointerFlags,
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
             :ButtonChangeType,      :pointer
    end
  end
end