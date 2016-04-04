module WinFFI
  module Kernel32
    VersionFlags = enum :version_flags, [
        # RtlVerifyVersionInfo() conditions
        :EQUAL,                       1,
        :GREATER,                     2,
        :GREATER_EQUAL,               3,
        :LESS,                        4,
        :LESS_EQUAL,                  5,
        :AND,                         6,
        :OR,                          7,

        :CONDITION_MASK,              7,
        :NUM_BITS_PER_CONDITION_MASK, 3,

        # Version info type constants
        # RtlVerifyVersionInfo() type mask bits
        :MINORVERSION,                0x0000001,
        :MAJORVERSION,                0x0000002,
        :BUILDNUMBER,                 0x0000004,
        :PLATFORMID,                  0x0000008,
        :SERVICEPACKMINOR,            0x0000010,
        :SERVICEPACKMAJOR,            0x0000020,
        :SUITENAME,                   0x0000040,
        :PRODUCT_TYPE,                0x0000080,

        # Product mask constants
        # RtlVerifyVersionInfo() os product type values
        :NT_WORKSTATION,              0x0000001,
        :NT_DOMAIN_CONTROLLER,        0x0000002,
        :NT_SERVER,                   0x0000003,

        # Platform definitions
        # dwPlatformId defines:
        :PLATFORM_WIN32s,             0,
        :PLATFORM_WIN32_WINDOWS,      1,
        :PLATFORM_WIN32_NT,           2
    ]
  end
end