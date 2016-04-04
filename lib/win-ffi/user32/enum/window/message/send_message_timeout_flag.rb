require 'win-ffi/user32'

module WinFFI
  module User32
    # SendMessageTimeout values
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644952(v=vs.85).aspx
    buffer =  [
        :ABORTIFHUNG, 0x0002, # The function returns without waiting for the time-out period to elapse if the receiving
        # thread appears to not respond or "hangs."

        :BLOCK,  0x0001, # Prevents the calling thread from processing any other requests until the function returns.

        :NORMAL, 0x0000, # The calling thread is not prevented from processing other requests while waiting for the
        # function to return.

        :NOTIMEOUTIFNOTHUNG, 0x0008, # The function does not enforce the time-out period as long as the receiving thread
        # is processing messages.
    ]

    if WindowsVersion >= :vista
      buffer += [
          :ERRORONEXIT, 0x0020 # The function should return 0 if the receiving window_class is destroyed or its
           # owning thread dies while the message is being processed.
      ]
    end

    SendMessageTimeoutFlag = enum :send_message_timeout_flag, buffer
  end
end