require 'win-ffi/structs/rect'

module WinFFI
  module User32
    class GuiThreadInfo < FFIStruct
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
