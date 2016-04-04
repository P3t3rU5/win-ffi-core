require 'win-ffi/user32'

module WinFFI
  module User32
    buffer = [
      :WINDOW_HANDLE,  0x00000000, # The hRecipient parameter is a window_class handle.
      :SERVICE_HANDLE, 0x00000001, # The hRecipient parameter is a service status handle.
    ]

    if WindowsVersion >= :xp
      buffer += [
          # In addition, you can specify the following value.
          :ALL_INTERFACE_CLASSES, 0x00000004, # Notifies the recipient of device interface events for all device
          # interface classes. (The dbcc_classguid member is ignored.) This value can be used only if the
          # dbch_devicetype member is DBT_DEVTYP_DEVICEINTERFACE.
      ]
    end

    DeviceNotifyFlag = enum :device_notify_flag, buffer
  end
end