module WinFFI
  module User32
    ScrollBarCommand = enum :scroll_bar_command, [
        # Scroll Bar Commands
        :LINEUP,        0,
        :LINELEFT,      0,
        :LINEDOWN,      1,
        :LINERIGHT,     1,
        :PAGEUP,        2,
        :PAGELEFT,      2,
        :PAGEDOWN,      3,
        :PAGERIGHT,     3,
        :THUMBPOSITION, 4,
        :THUMBTRACK,    5,
        :TOP,           6,
        :LEFT,          6,
        :BOTTOM,        7,
        :RIGHT,         7,
        :ENDSCROLL,     8
    ]
  end
end