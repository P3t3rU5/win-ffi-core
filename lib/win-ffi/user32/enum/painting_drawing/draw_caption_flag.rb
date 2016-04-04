require 'win-ffi/user32'

module WinFFI
  module User32
    buffer = [
      :ACTIVE,   0x0001,
      :SMALLCAP, 0x0002,
      :ICON,     0x0004,
      :TEXT,     0x0008,
      :INBUTTON, 0x0010,
      :GRADIENT, 0x0020,
    ]

    if WindowsVersion >= :xp
      buffer += [:BUTTONS,  0x1000]
    end

    DrawCaptionFlag = enum :draw_caption_flag, buffer
  end
end