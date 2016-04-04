module WinFFI
  module Kernel32
    JobObjectLimit = enum :job_object_limit, [
        # Basic Limits
        :WORKINGSET,        0x00000001,
        :PROCESS_TIME,      0x00000002,
        :JOB_TIME,          0x00000004,
        :ACTIVE_PROCESS,    0x00000008,
        :AFFINITY,          0x00000010,
        :PRIORITY_CLASS,    0x00000020,
        :PRESERVE_JOB_TIME, 0x00000040,
        :SCHEDULING_CLASS,  0x00000080,

        # Extended Limits
        :PROCESS_MEMORY,             0x00000100,
        :JOB_MEMORY,                 0x00000200,
        :JOB_MEMORY_HIGH,            0x00000200,
        :DIE_ON_UNHANDLED_EXCEPTION, 0x00000400,
        :BREAKAWAY_OK,               0x00000800,
        :SILENT_BREAKAWAY_OK,        0x00001000,
        :KILL_ON_JOB_CLOSE,          0x00002000,
        :SUBSET_AFFINITY,            0x00004000,
        :JOB_MEMORY_LOW,             0x00008000,

        # Notification Limits
        :JOB_READ_BYTES,   0x00010000,
        :JOB_WRITE_BYTES,  0x00020000,
        :RATE_CONTROL,     0x00040000,
        :CPU_RATE_CONTROL, 0x00040000,
        :IO_RATE_CONTROL,  0x00080000,
        :NET_RATE_CONTROL, 0x00100000,
    ]
  end
end