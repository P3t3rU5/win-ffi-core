module WinFFI
  class POINTS < FFIAdditions::Struct
    layout x: :short,
           y: :short

    def to_s
      "<POINTS x: #{x}, y: #{y}>"
    end

    def to_a
      [x, y]
    end

    alias_method :to_ary, :to_a
    alias_method :to_str, :to_s
  end
end