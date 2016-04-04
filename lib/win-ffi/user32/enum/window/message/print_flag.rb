module WinFFI
  module User32
    # WM_PRINT flags
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145216(v=vs.85).aspx
    PrintFlag = enum :print_flag, [
        :CHECKVISIBLE, 0x00000001,
        :NONCLIENT,    0x00000002,
        :CLIENT,       0x00000004,
        :ERASEBKGND,   0x00000008,
        :CHILDREN,     0x00000010,
        :OWNED,        0x00000020,
    ]
  end
end