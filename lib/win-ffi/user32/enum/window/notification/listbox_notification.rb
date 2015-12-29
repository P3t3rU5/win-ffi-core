require 'win-ffi/user32'

module WinFFI
  module User32
    ListBoxNotification = enum :list_box_notification,
    [
        :ERRSPACE,  -2,
        :SELCHANGE,  1,
        :DBLCLK,     2,
        :SELCANCEL,  3,
        :SETFOCUS,   4,
        :KILLFOCUS,  5,
    ]
  end
end