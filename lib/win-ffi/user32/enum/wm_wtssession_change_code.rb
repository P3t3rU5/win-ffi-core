module WinFFI
  module User32
    # codes passed in WPARAM for WM_WTSSESSION_CHANGE
    if WindowsVersion >= :xp
      WM_WTSSESSION_CHANGE_Code = enum :WM_WTSSESSION_CHANGE_Code, [
          :CONSOLE_CONNECT,        0x1,
          :CONSOLE_DISCONNECT,     0x2,
          :REMOTE_CONNECT,         0x3,
          :REMOTE_DISCONNECT,      0x4,
          :SESSION_LOGON,          0x5,
          :SESSION_LOGOFF,         0x6,
          :SESSION_LOCK,           0x7,
          :SESSION_UNLOCK,         0x8,
          :SESSION_REMOTE_CONTROL, 0x9,
          :SESSION_CREATE,         0xa,
          :SESSION_TERMINATE,      0xb
      ]
    end
  end
end