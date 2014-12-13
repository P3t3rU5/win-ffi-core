module WinFFI
  module User32
    module Window

      class UpdateLayeredWindowInfo < FFI::Struct
        layout :cbSize,   :dword,
               :hdcDst,   :hdc,
               :pptDst,   POINT.ptr,
               :psize,    SIZE.ptr,
               :hdcSrc,   :hdc,
               :pptSrc,   POINT.ptr,
               :crKey,    :dword,
               :pblend,   :pointer,
               :dwFlags,  Window::LayeredWindowAttributesFlags,
               :prcDirty, RECT.ptr
      end

    end
  end
end