require 'win-ffi/general/struct/rect'

module WinFFI
  module User32
    class MENUBARINFO < FFIStruct
      layout :cbSize,      :dword,
             :rcBar,       RECT,
             :hMenu,       :hmenu,
             :hwndMenu,    :hwnd,
             :fBarFocused, :bool,
             :fFocused,    :bool

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end