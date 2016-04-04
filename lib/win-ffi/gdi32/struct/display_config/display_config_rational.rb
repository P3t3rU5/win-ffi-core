module WinFFI
  module Gdi32
    class DISPLAYCONFIG_RATIONAL < FFIStruct
      layout :Numerator,   :uint32,
             :Denominator, :uint32
    end
  end
end