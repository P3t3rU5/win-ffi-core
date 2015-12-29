module WinFFI
  module Gdi32
    extend LibBase
    class LOGBRUSH < FFIStruct
      layout :lbStyle, :uint,
             :lbColor, :colorref,
             :lbHatch, :uint
    end
  end
end
