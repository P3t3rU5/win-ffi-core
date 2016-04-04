module WinFFI
  module Gdi32
    class FIXED < FFIStruct
      layout :fract, :word,
             :vlaue, :short
    end
  end
end