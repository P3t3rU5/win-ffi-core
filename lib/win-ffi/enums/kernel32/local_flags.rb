require 'win-ffi/enums/kernel32'

module WinFFI
  module Kernel32
    LocalFlags = enum :local_flags,
    [
      :FIXED,          0x0000,
      :MOVEABLE,       0x0002,
      :NOCOMPACT,      0x0010,
      :NODISCARD,      0x0020,
      :ZEROINIT,       0x0040,
      :MODIFY,         0x0080,
      :DISCARDABLE,    0x0F00,
      :VALID_FLAGS,    0x0F72,
      :INVALID_HANDLE, 0x8000,
      :DISCARDED,      0x4000,
      :LOCKCOUNT,      0x00FF
    ]
  end
end