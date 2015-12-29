module WinFFI
  module User32
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
