require 'win-ffi/user32'

module WinFFI
  module User32
    # User Button Notification Codes
    ButtonNotification = enum :button_notification,
    [
        :CLICKED,       0,
        :PAINT,         1,
        :HILITE,
        :PUSHED,        2,
        :UNHILITE,
        :UNPUSHED,      3,
        :DISABLE,       4,
        :DBLCLK,
        :DOUBLECLICKED, 5,
        :SETFOCUS,      6,
        :KILLFOCUS,     7
    ]
  end
end