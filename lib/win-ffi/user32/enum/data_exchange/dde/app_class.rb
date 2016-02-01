module WinFFI
  module User32
    # Application classification flags
    AppClass = enum :app_class, [
        :STANDARD, 0x00000000,
        :MONITOR,  0x00000001,
        :MASK,     0x0000000F,
    ]
  end
end


