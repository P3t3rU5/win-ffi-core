module WinFFI
  module User32
    if WindowsVersion >= 8
      # wParam values for WM_POINTERDEVICECHANGE
      PointerDeviceChange = enum :pointer_device_change, [
          :ARRIVAL,                   0x001,
          :REMOVAL,                   0x002,
          :ORIENTATION_0,             0x004,
          :ORIENTATION_90,            0x008,
          :ORIENTATION_180,           0x010,
          :ORIENTATION_270,           0x020,
          :MODE_DEFAULT,              0x040,
          :MODE_CENTERED,             0x080,
          :MAPPING_CHANGE,            0x100,
          :RESOLUTION,                0x200,
          :ORIGIN,                    0x400,
          :MODE_ASPECTRATIOPRESERVED, 0x800
      ]
    end
  end
end