module WinFFI
  module User32
    if WindowsVersion >= 8
      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh802890(v=vs.85).aspx
      POINTER_DEVICE_CURSOR_TYPE = enum :pointer_device_cursor_type, [
          :UNKNOWN, 0x00000000, # Unidentified cursor.
          :TIP,     0x00000001, # Pen tip.
          :ERASER,  0x00000002, # Pen eraser.
          :MAX,     0xFFFFFFFF  # Forces this enumeration to compile to 32 bits in size. Without this value, some
          # compilers would allow this enumeration to compile to a size other than 32 bits. You should not use this value.
      ]
    end
  end
end