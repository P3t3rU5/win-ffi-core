module WinFFI
  class POINTS < FFIStruct
    layout :x, :short,
           :y, :short

    def to_s
      "POINT x = #{x}, y = #{y}"
    end
  end
end