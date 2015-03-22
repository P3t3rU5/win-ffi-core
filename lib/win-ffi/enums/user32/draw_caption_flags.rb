module WinFFI
  module User32
    DrawCaptionFlags = enum :draw_caption_flags,
    [
      :ACTIVE,   0x0001,
      :SMALLCAP, 0x0002,
      :ICON,     0x0004,
      :TEXT,     0x0008,
      :INBUTTON, 0x0010,
      :GRADIENT, 0x0020,
      :BUTTONS,  0x1000
    ]
  end
end