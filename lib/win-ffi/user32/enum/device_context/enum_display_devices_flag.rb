require 'win-ffi/user32'

module WinFFI
  module User32
    EnumDisplayDevicesFlag = enum :enum_display_devices_flag, [
        :GET_DEVICE_INTERFACE_NAME, 0x00000001
    ]
  end
end