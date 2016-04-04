module WinFFI
  module Kernel32
    # Process priority flags
    PriorityClass = enum :priority_class, [
        :ABOVE_NORMAL, 0x00008000,
        :BELOW_NORMAL, 0x00004000,
        :HIGH,         0x00000080,
        :IDLE,         0x00000040,
        :NORMAL,       0x00000020,
        :REALTIME,     0x00000100
    ]
  end
end