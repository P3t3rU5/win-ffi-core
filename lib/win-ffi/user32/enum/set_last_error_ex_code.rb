module WinFFI
  module User32
    # SetLastErrorEx() types.
    SetLastErrorExCode = enum :set_last_error_ex_code, [
        :ERROR,      0x00000001,
        :MINORERROR, 0x00000002,
        :WARNING,    0x00000003,
    ]
  end
end