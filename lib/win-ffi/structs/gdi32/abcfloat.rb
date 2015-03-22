module WinFFI
  module Gdi32
    class ABCFLOAT < FFIStruct
      layout :abcfA, :float,
             :abcfB, :float,
             :abcfC, :int
    end
  end
end

