require 'win-ffi/user32'

module WinFFI
  module User32
    # Edit Control Messages
    EditMessage = enum :edit_message, [
        :GETSEL,               0x00B0,
        :SETSEL,               0x00B1,
        :GETRECT,              0x00B2,
        :SETRECT,              0x00B3,
        :SETRECTNP,            0x00B4,
        :SCROLL,               0x00B5,
        :LINESCROLL,           0x00B6,
        :SCROLLCARET,          0x00B7,
        :GETMODIFY,            0x00B8,
        :SETMODIFY,            0x00B9,
        :GETLINECOUNT,         0x00BA,
        :LINEINDEX,            0x00BB,
        :SETHANDLE,            0x00BC,
        :GETHANDLE,            0x00BD,
        :GETTHUMB,             0x00BE,
        :LINELENGTH,           0x00C1,
        :REPLACESEL,           0x00C2,
        :GETLINE,              0x00C4,
        :SETLIMITTEXT,         0x00C5,  # win40 Name change        :LIMITTEXT,            0x00C5,
        :CANUNDO,              0x00C6,
        :UNDO,                 0x00C7,
        :FMTLINES,             0x00C8,
        :LINEFROMCHAR,         0x00C9,
        :SETTABSTOPS,          0x00CB,
        :SETPASSWORDCHAR,      0x00CC,
        :EMPTYUNDOBUFFER,      0x00CD,
        :GETFIRSTVISIBLELINE,  0x00CE,
        :SETREADONLY,          0x00CF,
        :SETWORDBREAKPROC,     0x00D0,
        :GETWORDBREAKPROC,     0x00D1,
        :GETPASSWORDCHAR,      0x00D2,
        :SETMARGINS,           0x00D3,
        :GETMARGINS,           0x00D4,
        :GETLIMITTEXT,         0x00D5,
        :POSFROMCHAR,          0x00D6,
        :CHARFROMPOS,          0x00D7,
        :SETIMESTATUS,         0x00D8,
        :GETIMESTATUS,         0x00D9,
    ]
  end
end