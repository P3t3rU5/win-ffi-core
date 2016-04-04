require 'win-ffi/user32'

require 'win-ffi/user32/enum/queue_status_flag'

module WinFFI
  module User32
    # PeekMessage() Options
    PeekMessageFlag = enum :peek_message_flag,
    [
      :NOREMOVE, 0x0000, # Messages are not removed from the queue after processing by PeekMessage.
      :REMOVE,   0x0001, # Messages are removed from the queue after processing by PeekMessage.
      :NOYIELD,  0x0002, # Prevents the system from releasing any thread that is waiting for the caller to go idle
      # (see WaitForInputIdle). Combine this value with either PM_NOREMOVE or PM_REMOVE.

      :QS_INPUT,       QueueStatusFlag[:INPUT] << 16,
      :QS_POSTMESSAGE, (QueueStatusFlag[:POSTMESSAGE] | QueueStatusFlag[:HOTKEY] | QueueStatusFlag[:TIMER]) << 16,
      :QS_PAINT,       QueueStatusFlag[:PAINT] << 16,
      :QS_SENDMESSAGE, QueueStatusFlag[:SENDMESSAGE] << 16
    ]
  end
end