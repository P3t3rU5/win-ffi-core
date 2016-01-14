module WinFFI
  module User32
    if WindowsVersion >= 7
      TimerValueCoalescing = enum :timer_value_coalescing, [
          :DEFAULT_COALESCING, 0x00000000,
          :NO_COALESCING,      0xFFFFFFFF,
          :COALESCING_MIN,     0x00000001,
          :COALESCING_MAX,     0x7FFFFFF5,
      ]
    end
  end
end