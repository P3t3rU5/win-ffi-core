module WinFFI
  module Gdi32
    # https://msdn.microsoft.com/en-us/library/dd145024(v=vs.85).aspx
    class KERNINGPAIR < FFIStruct
      layout :wFirst,      :word,
             :wSecond,     :word,
             :iKernAmount, :int
    end
  end
end