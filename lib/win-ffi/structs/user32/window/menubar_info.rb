require 'win-ffi/structs/rect'

module WinFFI
  module User32
    class MENUBARINFO < FFIStruct
      layout :cbSize,      :dword,
             :rcBar,       RECT,
             :hMenu,       :hmenu,
             :hwndMenu,    :hwnd,
             :fBarFocused, :bool,
             :fFocused,    :bool
    end
  end
end