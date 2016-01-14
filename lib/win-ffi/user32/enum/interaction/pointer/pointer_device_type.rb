module WinFFI
  module User32
    if WindowsVersion >= 8
      buffer = [
          :INTEGRATED_PEN, 0x00000001,
          :EXTERNAL_PEN,   0x00000002,
          :TOUCH,          0x00000003,
          :MAX,            0xFFFFFFFF
      ]

      if WindowsVersion >= 8.1
        buffer += [
            :TOUCH_PAD, 0x00000004
        ]
      end

      POINTER_DEVICE_TYPE = enum :pointer_device_type, buffer
    end
  end
end