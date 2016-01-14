module WinFII
  module User32
    if WindowsVersion >= 7
      WindowDisplayAffinity = enum :window_display_affinity, [
          :NONE,     0x00000000,
          :MONITOR,  0x00000001,
      ]
    end
  end
end