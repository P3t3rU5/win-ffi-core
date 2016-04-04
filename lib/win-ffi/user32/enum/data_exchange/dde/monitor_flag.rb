module WinFFI
  module User32
    # Callback filter flags for use with MONITOR apps - 0 implies no monitor callbacks.
    MonitorFlag = enum :monitor_flag, [
        :HSZ_INFO,  0x01000000,
        :SENDMSGS,  0x02000000,
        :POSTMSGS,  0x04000000,
        :CALLBACKS, 0x08000000,
        :ERRORS,    0x10000000,
        :LINKS,     0x20000000,
        :CONV,      0x40000000,
        :MASK,      0xFF000000,
    ]
  end
end