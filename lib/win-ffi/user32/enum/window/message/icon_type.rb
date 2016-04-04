require 'win-ffi/user32'

module WinFFI
  module User32
    # WM_SETICON / WM_GETICON Type Codes
    buffer =  [
        :SMALL, 0,
        :BIG,   1
    ]
    buffer += [:SMALL2, 2] if WindowsVersion >= :xp

    IconType = enum :icon_type, buffer
  end
end

