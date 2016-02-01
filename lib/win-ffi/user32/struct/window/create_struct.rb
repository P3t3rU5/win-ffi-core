require 'win-ffi/user32/enum/window/style/window_style'
require 'win-ffi/user32/enum/window/style/window_style_ex'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632603(v=vs.85).aspx
    class CREATESTRUCT < FFIStruct
      layout :lpCreateParams, :pointer,
             :hInstance,      :hinstance,
             :hMenu,          :hmenu,
             :hwndParent,     :pointer,
             :height,         :int,
             :width,          :int,
             :y,              :int,
             :x,              :int,
             :style,          WindowStyle,
             :lpszName,       :string,
             :lpszClass,      :string,
             :dwExStyle,      WindowStyleExtended

      def to_s
        [:lpCreateParams, :x, :y, :width, :height, :style, :dwExStyle].map{|n| "#{n} = #{send(n)}"}.join(', ')
      end
    end
  end
end
