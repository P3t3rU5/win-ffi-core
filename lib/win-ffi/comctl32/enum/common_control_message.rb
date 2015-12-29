require 'win-ffi/comctl32'

module WinFFI
  module Comctl32
    buffer = [
        :FIRST,               0x2000, # Common control shared messages
        :LAST,                0x2200,
        :SETBKCOLOR,          0x2001, # lParam is bkColor
        :SETCOLORSCHEME,      0x2002, # lParam is color scheme
        :GETCOLORSCHEME,      0x2003, # fills in COLORSCHEME pointed to by lParam
        :GETDROPTARGET,       0x2004,
        :SETUNICODEFORMAT,    0x2005,
        :GETUNICODEFORMAT,    0x2006,
        :SETVERSION,          0x2007,
        :GETVERSION,          0x2008,
        :SETNOTIFYWINDOW,     0x2009, # wParam == hwndParent.
    ]
    if WindowsVersion >= :xp
      buffer += [
          :SETWINDOWTHEME,      0x200B,
          :DPISCALE,            0x200C, # wParam == Awareness
      ]
    end

    CommonControlMessage = enum :common_control_message, buffer
  end
end