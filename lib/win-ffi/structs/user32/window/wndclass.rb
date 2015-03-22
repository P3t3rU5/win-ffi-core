require_relative '../../../functions/user32/window/window_proc'

module WinFFI
  module User32
    class WNDCLASS < FFIStruct
      layout :style,         :uint,
             :lpfnWndProc,   WindowProc,
             :cbClsExtra,    :int,
             :cbWndExtra,    :int,
             :hInstance,     :hinstance,
             :hIcon,         :hicon,
             :hCursor,       :hcursor,
             :hbrBackground, :hbrush,
             :lpszMenuName,  :pointer,
             :lpszClassName, :pointer,
             :hIconSm,       :pointer
    end
  end
end