module WinFFI
  module User32
    # InSendMessageEx return value
    InSendMessageExReturn = enum :in_send_message_ex_return, [
        :NOSEND,   0x00000000,
        :SEND,     0x00000001, # The message was sent using the SendMessage or SendMessageTimeout function. If
        # ISMEX_REPLIED is not set, the thread that sent the message is blocked.
        :NOTIFY,   0x00000002, # The message was sent using the SendNotifyMessage function. The thread that sent the
        # message is not blocked.
        :CALLBACK, 0x00000004, # The message was sent using the SendMessageCallback function. The thread that sent the
        # message is not blocked.
        :REPLIED,  0x00000008  # The window_class procedure has processed the message. The thread that sent the message is no
        # longer blocked.
    ]
  end
end