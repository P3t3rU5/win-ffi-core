require 'win-ffi/core'

module WinFFI
  # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162897(v=vs.85).aspx
  class RECT < FFIAdditions::Struct
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
      "(left = #{left}, top = #{top}, width = #{right - left}, height = #{bottom - top})"
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      left == other.left &&  top == other.top && right == other.right&& bottom == other.bottom
    end
  end
end