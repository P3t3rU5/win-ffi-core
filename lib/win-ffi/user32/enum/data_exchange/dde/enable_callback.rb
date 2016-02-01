module WinFFI
  module User32
    EnableCallback = enum :enable_callback, [
        :ENABLEALL,    0x0000,
        :ENABLEONE,    0x0080,
        :DISABLE,      0x0008,
        :QUERYWAITING, 0x0002,
    ]
  end
end