require 'win-ffi/general/struct/rect'

module WinFFI
  module User32

    class SHELLHOOKINFO < FFIStruct
      layout :hwnd, :hwnd,
             :rc,   RECT
    end
  end
end