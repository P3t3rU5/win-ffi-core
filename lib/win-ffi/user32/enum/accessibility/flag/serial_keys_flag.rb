module WinFFI
  module User32
    # flags for SERIALKEYS dwFlags field
    SerialKeysFlag = enum :serial_keys_flag, [
        :SERIALKEYSON, 0x00000001,
        :AVAILABLE,    0x00000002,
        :INDICATOR,    0x00000004,
    ]
  end
end