module WinFFI
  module User32
    DdeNameService = enum :dde_name_service, [
        :REGISTER,   0x0001,
        :UNREGISTER, 0x0002,
        :FILTERON,   0x0004,
        :FILTEROFF,  0x0008,
    ]
  end
end