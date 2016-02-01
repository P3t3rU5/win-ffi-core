require 'win-ffi/user32'
require 'win-ffi/user32/enum/data_exchange/dde/transaction_class'

module WinFFI
  module User32
    TransactionType = enum :transaction_type, [
        :NOBLOCK,         0x0002,  # CBR_BLOCK will not work
        :NODATA,          0x0004,  # DDE_FDEFERUPD
        :ACKREQ,          0x0008,  # DDE_FACKREQ
        :ERROR,           0x0000 | TransactionClass[:NOTIFICATION] | 0x0002,
        :ADVDATA,         0x0010 | TransactionClass[:FLAGS],
        :ADVREQ,          0x0020 | TransactionClass[:DATA] | 0x0002,
        :ADVSTART,        0x0030 | TransactionClass[:BOOL],
        :ADVSTOP,         0x0040 | TransactionClass[:NOTIFICATION],
        :EXECUTE,         0x0050 | TransactionClass[:FLAGS],
        :CONNECT,         0x0060 | TransactionClass[:BOOL] | 0x0002,
        :CONNECT_CONFIRM, 0x0070 | TransactionClass[:NOTIFICATION] | 0x0002,
        :XACT_COMPLETE,   0x0080 | TransactionClass[:NOTIFICATION],
        :POKE,            0x0090 | TransactionClass[:FLAGS],
        :REGISTER,        0x00A0 | TransactionClass[:NOTIFICATION] | 0x0002,
        :REQUEST,         0x00B0 | TransactionClass[:DATA],
        :DISCONNECT,      0x00C0 | TransactionClass[:NOTIFICATION] | 0x0002,
        :UNREGISTER,      0x00D0 | TransactionClass[:NOTIFICATION] | 0x0002,
        :WILDCONNECT,     0x00E0 | TransactionClass[:DATA] | 0x0002,
        :MONITOR,         0x00F0 | TransactionClass[:NOTIFICATION] | 0x0002,
        :MASK,            0x00F0,
        :SHIFT,           0x0004  #  shift to turn XTYP_ into an index
    ]
  end
end