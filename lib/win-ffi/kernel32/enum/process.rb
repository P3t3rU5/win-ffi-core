module WinFFI
  module Kernel32
    # Process access rights
    buffer = [
        :TERMINATE,                  (0x0001),
        :CREATE_THREAD,              (0x0002),
        :SET_SESSIONID,              (0x0004),
        :VM_OPERATION,               (0x0008),
        :VM_READ,                    (0x0010),
        :VM_WRITE,                   (0x0020),
        :DUP_HANDLE,                 (0x0040),
        :CREATE_PROCESS,             (0x0080),
        :SET_QUOTA,                  (0x0100),
        :SET_INFORMATION,            (0x0200),
        :QUERY_INFORMATION,          (0x0400),
        :SUSPEND_RESUME,             (0x0800),
        :QUERY_LIMITED_INFORMATION,  (0x1000),
        :SET_LIMITED_INFORMATION,    (0x2000)
    ]

    buffer += if WindowsVersion >= :vista
      [:ALL_ACCESS, 0x001FFFFF]
    else
      [:ALL_ACCESS, 0x001F0FFF]
    end

    Process = enum :process, buffer
  end
end