require 'win-ffi/enums/kernel32'

module WinFFI
  module Kernel32
    INVALID_HANDLE_VALUE           = 0xFFFFFFFF
    HANDLE_FLAG_INHERIT            = 0x00000001
    HANDLE_FLAG_PROTECT_FROM_CLOSE = 0x00000002
  end
end