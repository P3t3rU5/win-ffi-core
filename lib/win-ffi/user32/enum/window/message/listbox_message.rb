require 'win-ffi/user32'

module WinFFI
  module User32
    list_messages = [
        :ADDSTRING,           0x0180,
        :INSERTSTRING,        0x0181,
        :DELETESTRING,        0x0182,
        :SELITEMRANGEEX,      0x0183,
        :RESETCONTENT,        0x0184,
        :SETSEL,              0x0185,
        :SETCURSEL,           0x0186,
        :GETSEL,              0x0187,
        :GETCURSEL,           0x0188,
        :GETTEXT,             0x0189,
        :GETTEXTLEN,          0x018A,
        :GETCOUNT,            0x018B,
        :SELECTSTRING,        0x018C,
        :DIR,                 0x018D,
        :GETTOPINDEX,         0x018E,
        :FINDSTRING,          0x018F,
        :GETSELCOUNT,         0x0190,
        :GETSELITEMS,         0x0191,
        :SETTABSTOPS,         0x0192,
        :GETHORIZONTALEXTENT, 0x0193,
        :SETHORIZONTALEXTENT, 0x0194,
        :SETCOLUMNWIDTH,      0x0195,
        :ADDFILE,             0x0196,
        :SETTOPINDEX,         0x0197,
        :GETITEMRECT,         0x0198,
        :GETITEMDATA,         0x0199,
        :SETITEMDATA,         0x019A,
        :SELITEMRANGE,        0x019B,
        :SETANCHORINDEX,      0x019C,
        :GETANCHORINDEX,      0x019D,
        :SETCARETINDEX,       0x019E,
        :GETCARETINDEX,       0x019F,
        :SETITEMHEIGHT,       0x01A0,
        :GETITEMHEIGHT,       0x01A1,
        :FINDSTRINGEXACT,     0x01A2,
        :SETLOCALE,           0x01A5,
        :GETLOCALE,           0x01A6,
        :SETCOUNT,            0x01A7,
        :INITSTORAGE,         0x01A8,
        :ITEMFROMPOINT,       0x01A9
    ]

#if defined(_WIN32_WCE) && (_WIN32_WCE >= 0x0400)
        # :MULTIPLEADDSTRING,   0x01B1,
#endif
#elif defined(_WIN32_WCE) && (_WIN32_WCE >= 0x0400)
# :MSGMAX,              0x01B1,

    list_messages += WindowsVersion > :xp ? [:GETLISTBOXINFO, 0x01B2, :MSGMAX, 0x01B3] : [:MSGMAX, 0x01B0]

    ListBoxMessage = enum :list_box_message, list_messages
  end
end
