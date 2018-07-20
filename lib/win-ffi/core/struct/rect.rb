module WinFFI
  # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162897(v=vs.85).aspx
  class RECT < FFIAdditions::Struct
    def left; end
    def left=(v) end
    def top; end
    def top=(v) end
    def right; end
    def right=(v) end
    def bottom; end
    def bottom=(v) end

    layout left:   :long,
           top:    :long,
           right:  :long,
           bottom: :long

    def width
      right - left
    end

    def width=(v)
      self.right = left + v
    end

    def height
      bottom - top
    end

    def height=(v)
      self.bottom = top + v
    end

    def to_s
      "<RECT left = #{left}, top = #{top}, width = #{right - left}, height = #{bottom - top}>"
    end

    def to_a
      [left, top, right, bottom]
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      left == other.left &&  top == other.top && right == other.right&& bottom == other.bottom
    end

    alias_method :to_ary, :to_a
    alias_method :to_str, :to_s
  end
end