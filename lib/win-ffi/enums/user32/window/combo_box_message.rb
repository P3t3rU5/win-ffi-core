module WinFFI
  module User32
    ComboBoxMessage = enum :combo_box_message,
    [
        :GETEDITSEL,            0x0140,
        :LIMITTEXT,             0x0141,
        :SETEDITSEL,            0x0142,
        :ADDSTRING,             0x0143,
        :DELETESTRING,          0x0144,
        :DIR,                   0x0145,
        :GETCOUNT,              0x0146,
        :GETCURSEL,             0x0147,
        :GETLBTEXT,             0x0148,
        :GETLBTEXTLEN,          0x0149,
        :INSERTSTRING,          0x014A,
        :RESETCONTENT,          0x014B,
        :FINDSTRING,            0x014C,
        :SELECTSTRING,          0x014D,
        :SETCURSEL,             0x014E,
        :SHOWDROPDOWN,          0x014F,
        :GETITEMDATA,           0x0150,
        :SETITEMDATA,           0x0151,
        :GETDROPPEDCONTROLRECT, 0x0152,
        :SETITEMHEIGHT,         0x0153,
        :GETITEMHEIGHT,         0x0154,
        :SETEXTENDEDUI,         0x0155,
        :GETEXTENDEDUI,         0x0156,
        :GETDROPPEDSTATE,       0x0157,
        :FINDSTRINGEXACT,       0x0158,
        :SETLOCALE,             0x0159,
        :GETLOCALE,             0x015A,
        :GETTOPINDEX,           0x015b,
        :MSGMAX,                0x015B,
        :SETTOPINDEX,           0x015c,
        :GETHORIZONTALEXTENT,   0x015d,
        :SETHORIZONTALEXTENT,   0x015e,
        :GETDROPPEDWIDTH,       0x015f,
        :SETDROPPEDWIDTH,       0x0160,
        :INITSTORAGE,           0x0161,
        :MSGMAX,                0x0162,
        :MULTIPLEADDSTRING,     0x0163,
        :MSGMAX,                0x0163,
    ]
    if WindowsVersion >= :xp
      ComboBoxMessage.instance_variable_get(:@kv_map)[:GETCOMBOBOXINFO] = 0x0164
      ComboBoxMessage.instance_variable_get(:@kv_map)[:MSGMAX] = 0x0165
      ComboBoxMessage.instance_variable_get(:@kv_map)[0x0164] = :GETCOMBOBOXINFO
      ComboBoxMessage.instance_variable_get(:@kv_map)[0x0165] = :MSGMAX
    end
  end
end