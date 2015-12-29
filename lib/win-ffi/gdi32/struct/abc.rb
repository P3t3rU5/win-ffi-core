module WinFFI
  module Gdi32
    class ABC < FFIStruct
      layout :abcA, :int,
             :abcB, :uint,
             :abcC, :int
    end
  end
end