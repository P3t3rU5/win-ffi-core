module WinFFI
  class POINT < FFIAdditions::Struct
    def x; end
    def x=(v) end
    def y; end
    def y=(v) end

    layout x: :long,
           y: :long

    def to_s
      "<POINT x: #{x}, y: #{y}>"
    end

    def to_a
      [x, y]
    end

    alias_method :to_ary, :to_a
    alias_method :to_str, :to_s
  end
end