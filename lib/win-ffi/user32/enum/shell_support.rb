module WinFFI
  module User32
    # Shell support
    buffer = [
        :WINDOWCREATED,            1,
        :WINDOWDESTROYED,          2,
        :ACTIVATESHELLWINDOW,      3,
        :WINDOWACTIVATED,          4,
        :GETMINRECT,               5,
        :REDRAW,                   6,
        :TASKMAN,                  7,
        :LANGUAGE,                 8,
        :SYSMENU,                  9,
        :ENDTASK,                 10,
        :ACCESSIBILITYSTATE,      11,
        :APPCOMMAND,              12,
        :HIGHBIT,             0x8000,
        :RUDEAPPACTIVATED,    0x8004,
        :FLASH,               0x8006
    ]

    if WindowsVersion >= :xp
      buffer += [
          :WINDOWREPLACED,  13,
          :WINDOWREPLACING, 14
      ]
      if WindowsVersion >= 8
        buffer += [:MONITORCHANGED, 16]
      end
    end

    ShellSupport = enum :shell_support, buffer
  end
end