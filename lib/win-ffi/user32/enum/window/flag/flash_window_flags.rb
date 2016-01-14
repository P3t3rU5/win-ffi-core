module WinFFI
  module User32
    FlashWindowFlags = enum :flash_window_flags, [
        :STOP,      0x00000000, # Stop flashing. The system restores the window_class to its original state.
        :CAPTION,   0x00000001, # Flash the window_class caption.
        :TRAY,      0x00000002, # Flash the taskbar button.
        :ALL,       0x00000003, # Flash both the window_class caption and taskbar button.
        :TIMER,     0x00000004, # Flash continuously, until the FLASHW_STOP flag is set.
        :TIMERNOFG, 0x0000000C, # Flash continuously until the window_class comes to the foreground.
    ]
  end
end