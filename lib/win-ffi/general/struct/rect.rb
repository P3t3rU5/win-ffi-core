require 'win-ffi/struct'

module WinFFI
  # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162897(v=vs.85).aspx
  class RECT < FFIStruct
    layout :left,   :long,
           :top,    :long,
           :right,  :long,
           :bottom, :long

    # def initialize(left, top, right, bottom)
    #   self.left, self.top, self.right, self.bottom = left, top, right, bottom
    # end

    def area
      width * height
    end

    def perimeter
      2 * width + 2 * height
    end

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
      "(left = #{left}, top = #{top}, width = #{width}, height = #{height})"
    end
  end
end