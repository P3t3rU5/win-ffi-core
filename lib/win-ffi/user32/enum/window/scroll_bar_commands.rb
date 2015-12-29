module WinFFI
  module User32
    ScrollBarCommands = enum :scroll_bar_commands, [
        # Scroll Bar Commands
        :LINEUP,
        :LINELEFT,      0,
        :LINEDOWN,
        :LINERIGHT,     1,
        :PAGEUP,
        :PAGELEFT,      2,
        :PAGEDOWN,
        :PAGERIGHT,     3,
        :THUMBPOSITION, 4,
        :THUMBTRACK,    5,
        :TOP,
        :LEFT,          6,
        :BOTTOM,
        :RIGHT,         7,
        :ENDSCROLL,     8
    ]
  end
end