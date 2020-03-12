module WinFFI
  # https://docs.microsoft.com/en-us/windows/win32/api/windef/ns-windef-point
  class POINT < FFIAdditions::Struct
    attr_accessor :x, :y

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