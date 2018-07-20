module WinFFI
  # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145106(v=vs.85).aspx
  class SIZE < FFIAdditions::Struct
    def cx; end
    def cx=(v) end
    def cy; end
    def cy=(v) end

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