module WinFFI
  module Kernel32
    # Job Access Rights
    JobObject = enum :JobObject, [
        :ASSIGN_PROCESS,          0x0001,
        :SET_ATTRIBUTES,          0x0002,
        :QUERY,                   0x0004,
        :TERMINATE,               0x0008,
        :SET_SECURITY_ATTRIBUTES, 0x0010,
        :ALL_ACCESS,          0x001F001F
    ]
  end
end

