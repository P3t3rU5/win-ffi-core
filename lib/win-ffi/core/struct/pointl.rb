module WinFFI
  # https://msdn.microsoft.com/en-us/library/dd162807(v=vs.85).aspx
  class POINTL < FFIAdditions::Struct
    def x; end
    def x=(v) end
    def y; end
    def y=(v) end

    layout x: :long,
           y: :long
  end
end