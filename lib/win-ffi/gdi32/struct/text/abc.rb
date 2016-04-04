module WinFFI
  module Gdi32
    # https://msdn.microsoft.com/en-us/library/dd162454(v=vs.85).aspx
    class ABC < FFIStruct
      layout :abcA, :int,
             :abcB, :uint,
             :abcC, :int
    end
  end
end