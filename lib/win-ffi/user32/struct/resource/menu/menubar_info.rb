require 'win-ffi/general/struct/rect'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647564(v=vs.85).aspx
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