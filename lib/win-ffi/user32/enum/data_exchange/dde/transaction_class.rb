require 'win-ffi/user32'

module WinFFI
  module User32
    TransactionClass = enum :transaction_class, [
        :MASK,         0xFC00,
        :BOOL,         0x1000,
        :DATA,         0x2000,
        :FLAGS,        0x4000,
        :NOTIFICATION, 0x8000,
    ]
  end
end