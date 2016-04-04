module WinFFI
  module User32
    # WM_NCCALCSIZE "window valid rect" return values
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632634(v=vs.85).aspx
    NonClientCalcSize = enum :non_client_calc_size, [
        :ALIGNTOP,     0x0010,
        :ALIGNLEFT,    0x0020,
        :ALIGNBOTTOM,  0x0040,
        :ALIGNRIGHT,   0x0080,
        :HREDRAW,      0x0100,
        :VREDRAW,      0x0200,
        :REDRAW,       0x0300,
        :VALIDRECTS,   0x0400
    ]
  end
end