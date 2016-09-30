module WinFFI
  class POINT < FFIAdditions::Struct
    layout x: :long,
           y: :long

    def to_s
      "POINT x = #{x}, y = #{y}"
    end

    def to_a
      [x, y]
    end
  end
end