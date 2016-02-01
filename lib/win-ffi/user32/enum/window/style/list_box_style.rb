require 'win-ffi/user32'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ff485967(v=vs.85).aspx
    # Listbox Styles
    ListBoxStyle = enum :list_box_style,
        [
            :NOTIFY,            0x0001,
            :SORT,              0x0002,
            :NOREDRAW,          0x0004,
            :MULTIPLESEL,       0x0008,
            :OWNERDRAWFIXED,    0x0010,
            :OWNERDRAWVARIABLE, 0x0020,
            :HASSTRINGS,        0x0040,
            :USETABSTOPS,       0x0080,
            :NOINTEGRALHEIGHT,  0x0100,
            :MULTICOLUMN,       0x0200,
            :WANTKEYBOARDINPUT, 0x0400,
            :EXTENDEDSEL,       0x0800,
            :DISABLENOSCROLL,   0x1000,
            :NODATA,            0x2000,
            :NOSEL,             0x4000,
            :COMBOBOX,          0x8000,
            #define LBS_STANDARD (LBS_NOTIFY | LBS_SORT | WS_VSCROLL | WS_BORDER)
            :STANDARD,          0xa00003
        ]
  end
end