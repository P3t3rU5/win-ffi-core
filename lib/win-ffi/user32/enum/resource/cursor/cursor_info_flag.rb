require 'win-ffi/user32'

module WinFFI
  module User32

    buffer = [
        :HIDDEN,  0x00000000,
        :SHOWING, 0x00000001
    ]

    buffer += [:SUPPRESSED, 0x00000002]

    CursorInfoFlag = enum :cursor_info_flag, buffer
  end
end