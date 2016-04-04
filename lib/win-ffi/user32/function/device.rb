require 'win-ffi/user32'

require 'win-ffi/user32/enum/device_notify_flag'

module WinFFI
  module User32
    if WindowsVersion >= :xp
      typedef :pointer, :hdevnotify

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363431(v=vs.85).aspx
      # HDEVNOTIFY WINAPI RegisterDeviceNotification(
      #   _In_  HANDLE hRecipient,
      #   _In_  LPVOID NotificationFilter,
      #   _In_  DWORD Flags )
      encoded_function 'RegisterDeviceNotification', [:handle, :pointer, DeviceNotifyFlag], :hdevnotify

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363475(v=vs.85).aspx
      # BOOL WINAPI UnregisterDeviceNotification( _In_  HDEVNOTIFY Handle )
      attach_function 'UnregisterDeviceNotification', [:hdevnotify], :bool
    end
  end
end