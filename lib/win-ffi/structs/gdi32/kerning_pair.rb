module WinFFI
  module Gdi32
    class KERNINGPAIR < FFIStruct
      layout :wFirst,      :word,
             :wSecond,     :word,
             :iKernAmount, :int
    end
  end
end