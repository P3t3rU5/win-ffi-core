module WinFFI
  module Device
    extend LibBase

    ffi_lib 'user32'

    DeviceNotifyFlags = enum :device_notify_flags, [
        :WINDOW_HANDLE, 0x00000000, # The hRecipient parameter is a window handle.

        :SERVICE_HANDLE, 0x00000001, # The hRecipient parameter is a service status handle.

        # In addition, you can specify the following value.
        :ALL_INTERFACE_CLASSES, 0x00000004, # Notifies the recipient of device interface events for all device interface
                                            # classes. (The dbcc_classguid member is ignored.) This value can be used only if the dbch_devicetype member is
                                            # DBT_DEVTYP_DEVICEINTERFACE.
    ]

    #HDEVNOTIFY WINAPI RegisterDeviceNotification(
    #  _In_  HANDLE hRecipient,
    #  _In_  LPVOID NotificationFilter,
    #  _In_  DWORD Flags )
    attach_function 'RegisterDeviceNotificationA', [:handle, :pointer, DeviceNotifyFlags], :pointer
    attach_function 'RegisterDeviceNotificationW', [:handle, :pointer, DeviceNotifyFlags], :pointer

    #BOOL WINAPI UnregisterDeviceNotification( _In_  HDEVNOTIFY Handle )
    attach_function 'UnregisterDeviceNotification', [:pointer], :bool

  end
end