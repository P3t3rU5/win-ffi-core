require 'win-ffi/user32/enum/window/style/window_style_ex'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644997(v=vs.85).aspx
    class DLGITEMTEMPLATE < FFIStruct
      layout :style,           :dword,
             :dwExtendedStyle, WindowStyleExtended,
             :x,               :short,
             :y,               :short,
             :cx,              :short,
             :cy,              :short,
             :id,              :word
    end
  end
end