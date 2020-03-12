module WinFFI
  # https://docs.microsoft.com/en-us/windows/win32/api/windef/ns-windef-rect
  class RECT < FFIAdditions::Struct
    attr_accessor :left, :top, :right, :bottom

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