require 'win-ffi/user32/enum/window/flag/gui_flag'

require 'win-ffi/general/struct/rect'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632604(v=vs.85).aspx
    class GUITHREADINFO < FFIStruct
      layout :cbSize,        :dword,
             :flags,         GUIFlag,
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
