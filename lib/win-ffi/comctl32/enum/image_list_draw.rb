module WinFFI
  module Comctl32
    buffer = [
        :NORMAL,        0x00000000,
        :TRANSPARENT,   0x00000001,
        :MASK,          0x00000010,
        :IMAGE,         0x00000020,
        :ROP,           0x00000040,
        :FOCUS,         0x00000002,
        :SELECTED,      0x00000004,
        :OVERLAYMASK,   0x00000F00,
        :PRESERVEALPHA, 0x00001000, # This preserves the alpha channel in dest
        :SCALE,         0x00002000, # Causes the image to be scaled to cx, cy instead of clipped
        :DPISCALE,      0x00004000,
    ]

    buffer += [:ASYNC, 0x00008000] if WindowsVersion >= :vista

    ImageListDraw = enum :image_list_draw, buffer
  end
end

