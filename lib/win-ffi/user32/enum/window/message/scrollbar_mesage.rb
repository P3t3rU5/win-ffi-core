module WinFFI
  module User32
    # Scroll bar messages
    buffer = [
        :SETPOS,          0x00E0,
        :GETPOS,          0x00E1,
        :SETRANGE,        0x00E2,
        :SETRANGEREDRAW,  0x00E6,
        :GETRANGE,        0x00E3,
        :ENABLE_ARROWS,   0x00E4,
        :SETSCROLLINFO,   0x00E9,
        :GETSCROLLINFO,   0x00EA,
    ]

    buffer += [:GETSCROLLBARINFO, 0x00EB] if WindowsVersion >= :xp

    ScrollbarMessage = enum :scrollbar_message, buffer
  end
end