require 'win-ffi/user32'

module WinFFI
  module User32
    # Edit Control Notification Codes
    EditNotification = enum :edit_notification,
    [
        :SETFOCUS,     0x0100,
        :KILLFOCUS,    0x0200,
        :CHANGE,       0x0300,
        :UPDATE,       0x0400,
        :ERRSPACE,     0x0500,
        :MAXTEXT,      0x0501,
        :HSCROLL,      0x0601,
        :VSCROLL,      0x0602,
        :ALIGN_LTR_EC, 0x0700,
        :ALIGN_RTL_EC, 0x0701
    ]
  end
end