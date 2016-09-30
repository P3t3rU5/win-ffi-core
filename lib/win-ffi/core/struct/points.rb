module WinFFI
  class POINTS < FFIAdditions::Struct
    layout x: :short,
           y: :short

    def to_s
      "POINT x = #{x}, y = #{y}"
    end
  end
end