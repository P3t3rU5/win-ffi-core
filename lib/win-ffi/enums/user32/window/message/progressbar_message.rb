module WinFFI
  module User32
    messages = [
        :SETRANGE,    0x0401,
        :SETPOS,      0x0402,
        :DELTAPOS,    0x0403,
        :SETSTEP,     0x0404,
        :STEPIT,      0x0405,
        :SETRANGE32,  0x0406,  # lParam = high, wParam = low
        :GETRANGE,    0x0407,  # wParam = return (TRUE ? low : high). lParam = PPBRANGE or NULL
        :GETPOS,      0x0408,
        :SETBARCOLOR, 0x0409, # lParam = bar color
        :SETBKCOLOR,  0x2001  # lParam = bkColor
    ]

    if WindowsVersion > :xp
      messages += [:SETMARQUEE, 0x040A]
      if WindowsVersion > :vista
        messages += [
            :GETSTEP,     0x040D,
            :GETBKCOLOR,  0x040E,
            :GETBARCOLOR, 0x040F,
            :SETSTATE,    0x0410, # wParam = PBST_[State] (NORMAL, ERROR, PAUSED)
            :GETSTATE,    0x0411
        ]
      end
    end

    ProgressBarMessage = enum :progressbar_message, messages
  end
end