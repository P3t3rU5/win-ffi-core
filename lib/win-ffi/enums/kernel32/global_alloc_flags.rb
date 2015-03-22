module WinFFI
  module Kernel32
    GlobalAllocFlags = enum :global_alloc_flags,
    [
      :GHND,          0x0042,
      :GMEM_FIXED,    0x0000,
      :GMEM_MOVABLE,  0002,
      :GMEM_ZEROINIT, 0x0040,
      :GPTR,          0x0040
    ]
  end
end