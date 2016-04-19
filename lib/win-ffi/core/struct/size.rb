module WinFFI
  # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145106(v=vs.85).aspx
  class SIZE < FFIStruct
    layout :cx, :long,
           :cy, :long

    def to_s
      "Size x=#{x}, y=#{y}"
    end

    alias_method :x,  :cx
    alias_method :x=, :cx=
    alias_method :y,  :cy
    alias_method :y=, :cy=
  end
end