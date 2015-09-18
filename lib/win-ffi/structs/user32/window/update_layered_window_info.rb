require 'win-ffi/structs/point'
require 'win-ffi/structs/size'
require 'win-ffi/enums/user32/layered_window_attributes_flags'
require 'win-ffi/structs/rect'


module WinFFI
  module User32
    class UPDATELAYEREDWINDOWINFO < FFIStruct
      layout :cbSize,   :dword,
             :hdcDst,   :hdc,
             :pptDst,   POINT.ptr,
             :psize,    SIZE.ptr,
             :hdcSrc,   :hdc,
             :pptSrc,   POINT.ptr,
             :crKey,    :dword,
             :pblend,   :pointer,
             :dwFlags,  LayeredWindowAttributesFlags,
             :prcDirty, RECT.ptr
    end
  end
end