require 'win-ffi/enums/user32'

module WinFFI
  module User32
    PeekMessageFlags = enum :peek_message_flags,
    [
      :NOREMOVE, 0x0000, # Messages are not removed from the queue after processing by PeekMessage.
      :REMOVE, 0x0001, # Messages are removed from the queue after processing by PeekMessage.
      :NOYIELD, 0x0002, # Prevents the system from releasing any thread that is waiting for the caller to go idle
      # (see WaitForInputIdle). Combine this value with either PM_NOREMOVE or PM_REMOVE.
    ]
  end
end