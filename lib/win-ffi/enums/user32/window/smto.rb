require 'win-ffi/enums/user32'

module WinFFI
  module User32
    SMTO = enum :smto,
      [
        :ABORTIFHUNG, 0x0002, # The function returns without waiting for the time-out period to elapse if the receiving
        # thread appears to not respond or "hangs."

        :BLOCK, 0x0001, # Prevents the calling thread from processing any other requests until the function returns.

        :NORMAL, 0x0000, # The calling thread is not prevented from processing other requests while waiting for the
        # function to return.

        :NOTIMEOUTIFNOTHUNG, 0x0008, # The function does not enforce the time-out period as long as the receiving thread
        # is processing messages.

        :ERRORONEXIT, 0x0020, # The function should return 0 if the receiving window is destroyed or its owning thread
        # dies while the message is being processed.
      ]
  end
end