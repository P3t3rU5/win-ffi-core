require 'win-ffi/user32'

module WinFFI
  module User32
    StaticMessage = enum :static_message, [
        :SETICON,  0x0170,
        :GETICON,  0x0171,
        :SETIMAGE, 0x0172,
        :GETIMAGE, 0x0173,
        :MSGMAX,   0x0174
    ]
  end
end