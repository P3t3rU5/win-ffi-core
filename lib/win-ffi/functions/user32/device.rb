require 'win-ffi/functions/user32'

require 'win-ffi/enums/user32/device_notify_flags'

module WinFFI
  module User32
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