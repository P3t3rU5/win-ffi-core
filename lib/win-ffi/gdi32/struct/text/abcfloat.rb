module WinFFI
  module Gdi32
    # https://msdn.microsoft.com/en-us/library/dd162455(v=vs.85).aspx
    class ABCFLOAT < FFIStruct
      layout :abcfA, :float,
             :abcfB, :float,
             :abcfC, :int
    end
  end
end

