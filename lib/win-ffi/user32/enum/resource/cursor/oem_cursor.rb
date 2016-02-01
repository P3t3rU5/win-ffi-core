require 'win-ffi/user32'

module WinFFI
  module User32
    OemCursor = enum :oem_cursor, [
        :ARROW,        32512,
        :IBEAM,        32513,
        :WAIT,         32514,
        :CROSS,        32515,
        :UPARROW,      32516,
        :SIZE,         32640, # OBSOLETE: use IDC_SIZEALL
        :ICON,         32641, # OBSOLETE: use IDC_ARROW
        :SIZENWSE,     32642,
        :SIZENESW,     32643,
        :SIZEWE,       32644,
        :SIZENS,       32645,
        :SIZEALL,      32646,
        :NO,           32648, # not in win3.1
        :HAND,         32649,
        :APPSTARTING,  32650, # not in win3.1
        :HELP,         32651,
    ]
  end
end