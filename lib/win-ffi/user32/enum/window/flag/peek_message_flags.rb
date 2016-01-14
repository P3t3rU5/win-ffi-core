require 'win-ffi/user32'

require 'win-ffi/user32/enum/flag/queue_status_flags'

module WinFFI
  module User32
    # PeekMessage() Options
    PeekMessageFlags = enum :peek_message_flags,
    [
      :NOREMOVE, 0x0000, # Messages are not removed from the queue after processing by PeekMessage.
      :REMOVE,   0x0001, # Messages are removed from the queue after processing by PeekMessage.
      :NOYIELD,  0x0002, # Prevents the system from releasing any thread that is waiting for the caller to go idle
      # (see WaitForInputIdle). Combine this value with either PM_NOREMOVE or PM_REMOVE.

      :QS_INPUT,       QueueStatusFlags[:INPUT] << 16,
      :QS_POSTMESSAGE, (QueueStatusFlags[:POSTMESSAGE] | QueueStatusFlags[:HOTKEY] | QueueStatusFlags[:TIMER]) << 16,
      :QS_PAINT,       QueueStatusFlags[:PAINT] << 16,
      :QS_SENDMESSAGE, QueueStatusFlags[:SENDMESSAGE] << 16
    ]
  end
end