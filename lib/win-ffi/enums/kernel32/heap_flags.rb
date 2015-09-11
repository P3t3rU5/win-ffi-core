require 'win-ffi/enums/kernel32'

module WinFFI
  module Kernel32
    HeapFlags = enum :heap_flags,
    [
      :NO_SERIALIZE,          0x00000001,
      :GENERATE_EXCEPTIONS,   0x00000004,
      :ZERO_MEMORY,           0x00000008,
      :REALLOC_IN_PLACE_ONLY, 0x00000010,
      :CREATE_ENABLE_EXECUTE, 0x00040000
    ]
  end
end