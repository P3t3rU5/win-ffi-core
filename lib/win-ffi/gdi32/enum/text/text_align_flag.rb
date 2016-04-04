module WinFFI
  module Gdi32
    # Text Alignment Options
    TextAlignFlag = enum :text_align_flag, [
        :NOUPDATECP,   0,
        :UPDATECP,     1,
        :LEFT,         0,
        :RIGHT,        2,
        :CENTER,       6,
        :TOP,          0,
        :BOTTOM,       8,
        :BASELINE,    24,
        :RTLREADING, 256,
        :MASK,       287,

        :VLEFT,   8,
        :VRIGHT,  0,
        :VBOTTOM, 2,
        :VTOP,    0
    ]
  end
end