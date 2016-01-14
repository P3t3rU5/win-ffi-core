require 'win-ffi/user32'

module WinFFI
  module User32
    # Message filter action values (action parameter to ChangeWindowMessageFilterEx)
    if WindowsVersion >= :vista
      # Message filter action values (action parameter to ChangeWindowMessageFilterEx)
      buffer = [
          :ADD,    1,
          :REMOVE, 2
      ]

      if WindowsVersion >= 7
        buffer += [
            :RESET,    0,
            :ALLOW,    1,
            :DISALLOW, 2,
        ]
      end
      MessageFilter = enum :message_filter, buffer
    end
  end
end