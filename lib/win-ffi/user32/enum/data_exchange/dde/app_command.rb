module WinFFI
  module User32
    # Application command flags
    AppCommand = enum :app_command, [
        :CLIENTONLY,  0x00000010,
        :FILTERINITS, 0x00000020,
        :MASK,        0x00000FF0,
    ]
  end
end



