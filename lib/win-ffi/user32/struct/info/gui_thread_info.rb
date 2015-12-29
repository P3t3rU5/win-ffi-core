require 'win-ffi/general/struct/rect'

module WinFFI
  module User32
    class GUITHREADINFO < FFIStruct
      layout :cbSize,        :dword,
             :flags,         :dword,
             :hwndActive,    :hwnd,
             :hwndFocus,     :hwnd,
             :hwndCapture,   :hwnd,
             :hwndMenuOwner, :hwnd,
             :hwndMoveSize,  :hwnd,
             :hwndCaret,     :hwnd,
             :rcCaret,       RECT

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end
