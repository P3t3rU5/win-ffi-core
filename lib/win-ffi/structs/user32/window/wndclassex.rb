require_relative '../../../enums/user32/window/style/window_class_style'

require_relative '../../../functions/user32/window/window_class'

module WinFFI
  module User32
    class WNDCLASSEX < FFIStruct
      layout :cbSize,        :uint,
             :style,         WindowClassStyle,
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

      #TODO
      #undef_method :cbSize=

      def initialize(class_name)
        super()
        @class_name = class_name
        self.cbSize = self.size
        self.lpszClassName = FFI::MemoryPointer.from_string(@class_name)
        @atom = nil
      end

      def atom
        @atom = User32::RegisterClassExW(self) unless @atom
        raise "RegisterClassEx Error" if @atom == 0
        @atom
      end
    end
  end
end