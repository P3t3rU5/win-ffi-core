module WinFFI
  module Kernel32
    # Process creation flags
    ProcessCreationFlag = enum :process_creation_flag, [
        :SUSPENDED,                 0x00000004,
        :NEW_CONSOLE,               0x00000010,
        :NEW_PROCESS_GROUP,         0x00000200,
        :UNICODE_ENVIRONMENT,       0x00000400,
        :SEPARATE_WOW_VDM,          0x00000800,
        :SHARED_WOW_VDM,            0x00001000,
        :FORCEDOS,                  0x00002000,
        :PROTECTED_PROCESS,         0x00040000,
        :BREAKAWAY_FROM_JOB,        0x01000000,
        :PRESERVE_CODE_AUTHZ_LEVEL, 0x02000000,
        :DEFAULT_ERROR_MODE,        0x04000000,
        :NO_WINDOW,                 0x08000000,
        :IGNORE_SYSTEM_DEFAULT,     0x80000000
    ]
  end
end