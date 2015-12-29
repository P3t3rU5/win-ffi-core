require 'win-ffi/user32'

module WinFFI
  module User32
    buffer = [
        :GETCHECK, 0x00F0,
        :SETCHECK, 0x00F1,
        :GETSTATE, 0x00F2,
        :SETSTATE, 0x00F3,
        :SETSTYLE, 0x00F4,
        :CLICK,    0x00F5,
        :GETIMAGE, 0x00F6,
        :SETIMAGE, 0x00F7
    ]

    buffer += [:SETDONTCLICK, 0x00F8,] if WindowsVersion >= :vista
    ButtonMessage = enum :button_message, buffer

  end
end