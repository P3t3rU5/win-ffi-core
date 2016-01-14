require 'win-ffi/user32/function/desktop'

require 'win-ffi/user32/struct/window/luid'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644957(v=vs.85).aspx
    if WindowsVersion >= :xp
      class BSMINFO < FFIStruct
        layout :cItems, :int,
               :hdesk,  :hdesk,
               :hwnd,   :hwnd,
               :luid,   LUID
      end
    end
  end
end