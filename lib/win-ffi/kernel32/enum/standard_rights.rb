module WinFFI
  module Kernel32
    StandardRights = enum :standard_rights, [
        :REQUIRED,  0x000F0000,
        :READ,      0x00020000,
        :WRITE,     0x00020000,
        :EXECUTE,   0x00020000,
        :ALL,       0x001F0000
    ]
  end
end