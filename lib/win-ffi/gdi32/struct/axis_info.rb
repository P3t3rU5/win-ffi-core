#define MM_MAX_AXES_NAMELEN 16

module WinFFI
  module Gdi32
    class AXISINFO < FFIStruct
      layout :axMinValue, :long,
             :axMaxValue, :long,
             :axAxisName, WideInlineString.new(16)
    end
  end
end