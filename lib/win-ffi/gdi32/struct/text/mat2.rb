require 'win-ffi/gdi32/struct/text/fixed'

module WinFFI
  module Gdi32
    # https://msdn.microsoft.com/en-us/library/dd145048(v=vs.85).aspx
    class MAT2 < FFIStruct
      layout :eM11, FIXED,
             :eM12, FIXED,
             :eM21, FIXED,
             :eM22, FIXED
    end
  end
end