require 'win-ffi/structs/user32/window/luid'

module WinFFI
  module User32
    class BSINFO < FFIStruct
      layout :cItems,    :int,
             :hdesk,     :hdesk,
             :hwnd,      :hwnd,
             :luid,      LUID
    end
  end
end