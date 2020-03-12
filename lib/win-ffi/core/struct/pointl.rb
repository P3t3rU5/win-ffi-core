module WinFFI
  # https://docs.microsoft.com/en-us/windows/win32/api/windef/ns-windef-pointl
  class POINTL < FFIAdditions::Struct
    def x; end
    def x=(v) end
    def y; end
    def y=(v) end

    layout x: :long,
           y: :long
  end
end