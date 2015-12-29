require 'win-ffi/user32/enum/pointer_input_type'
require 'win-ffi/user32/enum/pointer_flags'

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