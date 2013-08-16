module WinFFI
  module User32
    module Window

      class ALTTABINFO < FFI::Struct
        layout :cbSize,    :dword,
               :cItems,    :int,
               :cColumns,  :int,
               :cRows,     :int,
               :iColFocus, :int,
               :iRowFocus, :int,
               :cxItem,    :int,
               :cyItem,    :int,
               :ptStart,    POINT
      end

      class FLASHWINFO < FFI::Struct
        layout :cbSize,    :uint,
               :hwnd,      :hwnd,
               :dwFlags,   :dword,
               :uCount,    :uint,
               :dwTimeout, :dword
      end

      class GUITHREADINFO < FFI::Struct
        layout :cbSize,        :dword,
               :flags,         :dword,
               :hwndActive,    :hwnd,
               :hwndFocus,     :hwnd,
               :hwndCapture,   :hwnd,
               :hwndMenuOwner, :hwnd,
               :hwndMoveSize,  :hwnd,
               :hwndCaret,     :hwnd,
               :rcCaret,       RECT
      end

      class TITLEBARINFO < FFI::Struct
        layout :cbSize,        :dword,
               :rcTitleBar,    RECT,
               :rgstate,       :dword
      end

      class UPDATELAYEREDWINDOWINFO < FFI::Struct
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