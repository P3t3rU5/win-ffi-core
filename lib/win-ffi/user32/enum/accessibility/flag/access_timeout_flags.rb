module WinFFI
  module User32
    # ACCESSTIMEOUT dwFlags field
    AccessTimeoutFlags = enum :access_timeout_flgas, [
        :TIMEOUTON,     0x00000001,
        :ONOFFFEEDBACK, 0x00000002
    ]
  end
end