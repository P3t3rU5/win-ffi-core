require 'win-ffi/user32'

module WinFFI
  module User32
    EnumDisplayDevicesFlags = enum :enum_display_devices_flags, [
        :GET_DEVICE_INTERFACE_NAME, 0x00000001
    ]
  end
end