module WinFFI
  SetErrorModeFlags = enum :set_error_mode_flags,
  [
    :FAILCRITICALERRORS,     0x0001,
    :NOALIGNMENTFAULTEXCEPT, 0x0004,
    :NOGPFAULTERRORBOX,      0x0002,
    :NOOPENFILEERRORBOX,     0x8000
  ]
end