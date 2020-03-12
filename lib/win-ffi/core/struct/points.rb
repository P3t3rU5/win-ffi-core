module WinFFI
  # https://docs.microsoft.com/en-us/windows/win32/api/windef/ns-windef-points
  class POINTS < FFIAdditions::Struct
    attr_accessor :x, :y
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