module WinFFI
  module Comctl32
    class COLORMAP < FFIStruct
      layout :from, :colorref,
             :to,   :colorref
    end
  end
end