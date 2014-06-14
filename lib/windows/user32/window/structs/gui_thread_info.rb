module WinFFI
  module User32
    module Window

      class GuiThreadInfo < FFI::Struct
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

    end
  end
end