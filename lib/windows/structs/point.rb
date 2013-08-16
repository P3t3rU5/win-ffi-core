module WinFFI
  class POINT < FFI::Struct
    layout :x, :long,
           :y, :long

    def to_s
      "(x = #{x}, y = #{y})"
    end
  end
end