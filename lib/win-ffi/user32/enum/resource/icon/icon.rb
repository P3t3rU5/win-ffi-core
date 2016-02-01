require 'win-ffi/user32'

module WinFFI
  module User32
    buffer =  [
        :SMALL, 0,
        :BIG,   1
    ]
    buffer += [:SMALL2, 2] if WindowsVersion >= :xp

    Icon = enum :icon, buffer
  end
end

