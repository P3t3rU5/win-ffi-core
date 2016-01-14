module WinFFI
  module User32
    if WindowsVersion >= 8
      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448797(v=vs.85).aspx
      INPUT_MESSAGE_ORIGIN_ID = enum :input_message_origin_id, [
          :UNAVAILABLE,  0x00000000,  # not specified
          :HARDWARE,     0x00000001,  # from a hardware device or injected by a UIAccess app
          :INJECTED,     0x00000002,  # injected via SendInput() by a non-UIAccess app
          :SYSTEM,       0x00000004,  # injected by the system
      ]
    end
  end
end