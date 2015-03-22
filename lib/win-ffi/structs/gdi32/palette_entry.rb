module WinFFI
  module Gdi32
    class PALETTEENTRY < FFIStruct
      layout :peRed,   :byte,
             :peGreen, :byte,
             :peBlue,  :byte,
             :peFlags, :byte
    end
  end
end