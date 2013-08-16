module WinFFI
  class RECT < FFI::Struct
    layout :left,   :long,
           :top,    :long,
           :right,  :long,
           :bottom, :long

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