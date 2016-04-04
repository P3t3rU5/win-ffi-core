module WinFFI
  module User32
    if WindowsVersion >= 8
      # https://msdn.microsoft.com/en-us/library/windows/desktop/jj653869(v=vs.85).aspx
      # Flags that appear in pointer input message parameters
      PointerMessageFlag = enum :pointer_message_flag, [
        :NEW,          0x00000001, # New pointer
        :INRANGE,      0x00000002, # Pointer has not departed
        :INCONTACT,    0x00000004, # Pointer is in contact
        :FIRSTBUTTON,  0x00000010, # Primary action
        :SECONDBUTTON, 0x00000020, # Secondary action
        :THIRDBUTTON,  0x00000040, # Third button
        :FOURTHBUTTON, 0x00000080, # Fourth button
        :FIFTHBUTTON,  0x00000100, # Fifth button
        :PRIMARY,      0x00002000, # Pointer is primary
        :CONFIDENCE,   0x00004000, # Pointer is considered unlikely to be accidental
        :CANCELED,     0x00008000, # Pointer is departing in an abnormal manner
      ]
    end
  end
end

