module WinFFI
  module User32
    ButtonNotification = enum :button_notification,
    [
        :CLICKED,       0,
        :PAINT,         1,
        :HILITE,        2,
        :UNHILITE,      3,
        :DISABLE,       4,
        :DOUBLECLICKED, 5,
        :PUSHED,        2,
        :UNPUSHED,      3,
        :DBLCLK,        5,
        :SETFOCUS,      6,
        :KILLFOCUS,     7,
    ]
  end
end