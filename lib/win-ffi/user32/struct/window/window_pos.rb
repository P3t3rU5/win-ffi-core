require 'win-ffi/user32/enum/window/set_window_pos_flags'

module WinFFI
  module User32
    class WINDOWPOS < FFIStruct
      FLAGS_INV = SetWindowPosFlags.to_hash.reduce(Hash.new{|h,k| h[k] = []}){|h,(k,v)| h[v] << k; h}.freeze

      layout :hwnd,            :pointer, #HWND
             :hwndInsertAfter, :pointer, #HWND
             :left,            :int,
             :top,             :int,
             :width,           :int,
             :height,          :int,
             :flags,           :uint

      def flags
        val = self[:flags]
        Set.new(FLAGS_INV.select { |k,_| val & k != 0 }.reduce([]) { |a,(_,v)| a << v }.flatten)
      end

      def flags=(flags)
        self[:flags] = [*flags].reduce(0) { |a,f| a | SetWindowPosFlags[f].to_i }
      end

      def right
        width + left
      end

      def right=(v)
        self.width = v - left
      end

      def bottom
        height + top
      end

      def bottom=(v)
        self.height = v - top
      end

      def to_s
        "left = #{left}, top = #{top}, width = #{width}, height = #{height}, flags = #{flags.to_a.inspect}"
      end
    end
  end
end
