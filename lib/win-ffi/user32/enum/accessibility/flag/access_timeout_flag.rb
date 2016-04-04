module WinFFI
  module User32
    # ACCESSTIMEOUT dwFlags field
    AccessTimeoutFlag = enum :access_timeout_flag, [
        :TIMEOUTON,     0x00000001,
        :ONOFFFEEDBACK, 0x00000002
    ]
  end
end