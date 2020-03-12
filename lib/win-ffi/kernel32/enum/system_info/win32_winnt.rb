module WinFFI
  module Kernel32
    # _WIN32_WINNT system_info constants
    WindowsVersion = enum :windows_versions, [
        :NT4,          0x0400,
        :WIN2K,        0x0500,
        :WINXP,        0x0501,
        :WS03,         0x0502,
        :WIN6,         0x0600,
        :WS08,         0x0600,
        :LONGHORN,     0x0600,
        :VISTA,        0x0600,
        :WIN7,         0x0601,
        :WIN8,         0x0602,
        :WINBLUE,      0x0603,
        :WINTHRESHOLD, 0x0A00, # ABRACADABRA_THRESHOLD
        :WIN10,        0x0A00  # ABRACADABRA_THRESHOLD
    ]

    define_prefix(:WIN32_WINNT, WindowsVersion)
  end
end