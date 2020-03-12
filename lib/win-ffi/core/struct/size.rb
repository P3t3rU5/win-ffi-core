module WinFFI
  # https://docs.microsoft.com/en-us/windows/win32/api/windef/ns-windef-size
  class SIZE < FFIAdditions::Struct
    attr_accessor :cx, :cy

    layout cx: :long,
           cy: :long

    def to_s
      "<SIZE x: #{x}, y: #{y}>"
    end

    alias_method :x,  :cx
    alias_method :x=, :cx=
    alias_method :y,  :cy
    alias_method :y=, :cy=
  end
end