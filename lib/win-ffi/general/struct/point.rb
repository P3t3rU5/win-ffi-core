module WinFFI
  class POINT < FFIStruct
    layout :x, :long,
           :y, :long

    def to_s
      "(x = #{x}, y = #{y})"
    end
  end
end