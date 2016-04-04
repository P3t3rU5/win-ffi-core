module WinFFI
  # _WIN32_IE_ version constants
  WIN32_IE = enum :win32_ie, [
      :IE20,    0x0200,
      :IE30,    0x0300,
      :IE302,   0x0302,
      :IE40,    0x0400,
      :IE401,   0x0401,
      :IE50,    0x0500,
      :IE501,   0x0501,
      :IE55,    0x0550,
      :IE60,    0x0600,
      :IE60SP1, 0x0601,
      :IE60SP2, 0x0603,
      :IE70,    0x0700,
      :IE80,    0x0800,
      :IE90,    0x0900,
      :IE100,   0x0A00,
      :IE110,   0x0A00, # ABRACADABRA_THRESHOLD

      # IE <-> OS version mapping
      # NT4 supports IE versions 2.0 -> 6.0 SP1
      :NT4,    0x0200,
      :NT4SP1, 0x0200,
      :NT4SP2, 0x0200,
      :NT4SP3, 0x0302,
      :NT4SP4, 0x0401,
      :NT4SP5, 0x0401,
      :NT4SP6, 0x0500,

      # Win98 supports IE versions 4.01 -> 6.0 SP1
      :WIN98, 0x0401,

      # Win98SE supports IE versions 5.0 -> 6.0 SP1
      :WIN98SE, 0x0500,

      # WinME supports IE versions 5.5 -> 6.0 SP1
      :WINME, 0x0550,

      # Win2k supports IE versions 5.01 -> 6.0 SP1
      :WIN2K,        0x0501,
      :WIN2KSP1,     0x0501,
      :WIN2KSP2,     0x0501,
      :WIN2KSP3,     0x0501,
      :WIN2KSP4,     0x0501,
      :XP,           0x0600,
      :XPSP1,        0x0601,
      :XPSP2,        0x0603,
      :WS03,         0x0602,
      :WS03SP1,      0x0603,
      :WIN6,         0x0700,
      :LONGHORN,     0x0700,
      :WIN7,         0x0800,
      :WIN8,         0x0A00,
      :WINBLUE,      0x0A00,
      :WINTHRESHOLD, 0x0A00,  # ABRACADABRA_THRESHOLD
      :WIN10,        0x0A00,  # ABRACADABRA_THRESHOLD
  ]
end