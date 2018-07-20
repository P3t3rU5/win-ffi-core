module WinFFI
  # https://docs.microsoft.com/en-us/dotnet/api/microsoft.visualstudio.ole.interop.sizel?view=visualstudiosdk-2017
  class SIZEL < FFIAdditions::Struct
    def cx; end
    def cx=(v) end
    def cy; end
    def cy=(v) end

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