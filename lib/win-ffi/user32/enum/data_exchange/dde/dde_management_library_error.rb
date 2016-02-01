module WinFFI
  module User32
    DdeManagementLibraryError = enum :dde_management_library_error, [
        :NO_ERROR,            0x0000, # must be 0
        :FIRST,               0x4000,
        :ADVACKTIMEOUT,       0x4000, # A request for a synchronous advise transaction has timed out.
        :BUSY,                0x4001, # The response to the transaction caused the DDE_FBUSY flag to be set.
        :DATAACKTIMEOUT,      0x4002, # A request for a synchronous data transaction has timed out.
        :DLL_NOT_INITIALIZED, 0x4003, # A DDEML function was called without first calling the DdeInitialize function, or
        # an invalid instance identifier was passed to a DDEML function.
        :DLL_USAGE,           0x4004, # An application initialized as APPCLASS_MONITOR has attempted to perform a DDE
        # transaction, or an application initialized as APPCMD_CLIENTONLY has attempted to perform server transactions.
        :EXECACKTIMEOUT,      0x4005, # A request for a synchronous execute transaction has timed out.
        :INVALIDPARAMETER,    0x4006, # A parameter failed to be validated by the DDEML. Some of the possible causes
        # follow:
        # The application used a data handle initialized with a different item name handle than was required by the
        # transaction.
        # The application used a data handle that was initialized with a different clipboard data format than was
        # required by the transaction.
        # The application used a client-side conversation handle with a server-side function or vice versa.
        # The application used a freed data handle or string handle.
        # More than one instance of the application used the same object.
        :LOW_MEMORY,          0x4007, # A DDEML application has created a prolonged race condition (in which the server
        # application outruns the client), causing large amounts of memory to be consumed.
        :MEMORY_ERROR,        0x4008, # A memory allocation has failed.
        :NOTPROCESSED,        0x4009, # A transaction has failed.
        :NO_CONV_ESTABLISHED, 0x400a, # A client's attempt to establish a conversation has failed.
        :POKEACKTIMEOUT,      0x400b, # A request for a synchronous poke transaction has timed out.
        :POSTMSG_FAILED,      0x400c, # An internal call to the PostMessage function has failed.
        :REENTRANCY,          0x400d, # An application instance with a synchronous transaction already in progress
        # attempted to initiate another synchronous transaction, or the DdeEnableCallback function was called from
        # within a DDEML callback function.
        :SERVER_DIED,         0x400e, # A server-side transaction was attempted on a conversation terminated by the
        # client, or the server terminated before completing a transaction.
        :SYS_ERROR,           0x400f, # An internal error has occurred in the DDEML.
        :UNADVACKTIMEOUT,     0x4010, # A request to end an advise transaction has timed out.
        :UNFOUND_QUEUE_ID,    0x4011, # An invalid transaction identifier was passed to a DDEML function. Once the
        # application has returned from an XTYP_XACT_COMPLETE callback, the transaction identifier for that callback
        # function is no longer valid.
        :LAST,                0x4011,
    ]
  end
end