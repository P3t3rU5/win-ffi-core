module WinFFI
  module User32
    # conversation states (usState)
    ConversationStates = enum :conversation_states, [
        :NULL,            0,  # quiescent states
        :INCOMPLETE,      1,
        :CONNECTED,       2,
        :INIT1,           3,  # mid-initiation states
        :INIT2,           4,
        :REQSENT,         5,  # active conversation states
        :DATARCVD,        6,
        :POKESENT,        7,
        :POKEACKRCVD,     8,
        :EXECSENT,        9,
        :EXECACKRCVD,    10,
        :ADVSENT,        11,
        :UNADVSENT,      12,
        :ADVACKRCVD,     13,
        :UNADVACKRCVD,   14,
        :ADVDATASENT,    15,
        :ADVDATAACKRCVD, 16,
    ]
  end
end