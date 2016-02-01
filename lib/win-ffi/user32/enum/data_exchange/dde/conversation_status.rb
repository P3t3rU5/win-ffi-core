module WinFFI
  module User32
    # conversation status bits (fsStatus)
    ConversationStatus = enum :conversation_status, [
        :CONNECTED,  0x0001,
        :ADVISE,     0x0002,
        :ISLOCAL,    0x0004,
        :BLOCKED,    0x0008,
        :CLIENT,     0x0010,
        :TERMINATED, 0x0020,
        :INLIST,     0x0040,
        :BLOCKNEXT,  0x0080,
        :ISSELF,     0x0100,
    ]
  end
end