module WinFFI
  module User32
    # Callback filter flags for use with standard apps.
    CallbackFilterFlags = enum :callback_filter_flags, [
        :FAIL_SELFCONNECTIONS,  0x00001000,
        :FAIL_CONNECTIONS,      0x00002000,
        :FAIL_ADVISES,          0x00004000,
        :FAIL_EXECUTES,         0x00008000,
        :FAIL_POKES,            0x00010000,
        :FAIL_REQUESTS,         0x00020000,
        :FAIL_ALLSVRXACTIONS,   0x0003f000,
        :SKIP_CONNECT_CONFIRMS, 0x00040000,
        :SKIP_REGISTRATIONS,    0x00080000,
        :SKIP_UNREGISTRATIONS,  0x00100000,
        :SKIP_DISCONNECTS,      0x00200000,
        :SKIP_ALLNOTIFICATIONS, 0x003c0000,
    ]
  end
end