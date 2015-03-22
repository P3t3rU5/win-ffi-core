require_relative '../../../enums/user32/layered_window_attributes_flags'

module WinFFI
  module User32
    class UpdateLayeredWindowInfo < FFIStruct
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