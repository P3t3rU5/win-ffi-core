module WinFFI
  module Gdi32
    module Brush
      extend LibBase
      class LOGBRUSH < FFI::Struct
        layout :lbStyle, :uint,
               :lbColor, :colorref,
               :lbHatch, :uint
      end
    end
  end
end