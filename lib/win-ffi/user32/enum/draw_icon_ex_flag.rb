require 'win-ffi/user32'

module WinFFI
  module User32
    buffer = [
        :MASK,         0x0001,
        :IMAGE,        0x0002,
        :NORMAL,       0x0003,
        :COMPAT,       0x0004,
        :DEFAULTSIZE,  0x0008,
    ]

    buffer += [:NOMIRROR, 0x0010] if WindowsVersion >= :xp

    DrawIconExFlag = enum :draw_icon_ex_flag, buffer
  end
end