module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448795(v=vs.85).aspx
    # Identifiers for message input source device type.
    buffer = [
        :UNAVAILABLE, 0x00000000,      # not specified
        :KEYBOARD,    0x00000001,      # from keyboard
        :MOUSE,       0x00000002,      # from mouse
        :TOUCH,       0x00000004,      # from touch
        :PEN,         0x00000008,      # from pen
    ]

    if WindowsVersion >= 8.1
      buffer += [
          :TOUCHPAD, 0x00000010, # from touchpad
      ]
    end

    INPUT_MESSAGE_DEVICE_TYPE = enum :input_message_device_type, buffer
  end
end

