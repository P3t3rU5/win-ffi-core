module WinFFI
  module User32
    buffer = [
        :CLIENTONLY, 0x00000001,
    ]

    if WindowsVersion >= 8.1
      buffer += [:RENDERFULLCONTENT, 0x00000002]
    end

    PrintWindowFlag = enum :print_window_flag, buffer
  end
end