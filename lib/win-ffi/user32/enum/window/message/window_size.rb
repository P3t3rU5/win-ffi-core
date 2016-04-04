module WinFFI
  module User32
    # WM_SIZE message wParam values
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632646(v=vs.85).aspx
    WindowSize = enum :window_size, [
        :RESTORED,  0,
        :MINIMIZED, 1,
        :MAXIMIZED, 2,
        :MAXSHOW,   3,
        :MAXHIDE,   4,

        # Obsolete constant names
        :NORMAL,     0,
        :ICONIC,     1,
        :FULLSCREEN, 2,
        :ZOOMSHOW,   3,
        :ZOOMHIDE,   4
    ]
  end
end