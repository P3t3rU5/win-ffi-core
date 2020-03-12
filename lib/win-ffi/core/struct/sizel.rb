module WinFFI
  # https://docs.microsoft.com/en-us/dotnet/api/microsoft.visualstudio.ole.interop.sizel?view=visualstudiosdk-2017
  class SIZEL < FFIAdditions::Struct
    attr_accessor :cx, :cy

    layout cx: :long,
           cy: :long

    def to_s
      "Size x=#{x}, y=#{y}"
    end

    alias_method :x,  :cx
    alias_method :x=, :cx=
    alias_method :y,  :cy
    alias_method :y=, :cy=
  end
end