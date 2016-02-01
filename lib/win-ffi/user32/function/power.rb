require 'win-ffi/user32'

module WinFFI
  module User32
    if WindowsVersion >= :vista

      require 'win-ffi/user32/enum/device_notify_flags'

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373196(v=vs.85).aspx
      # HPOWERNOTIFY WINAPI RegisterPowerSettingNotification(
      #   _In_  HANDLE hRecipient,
      #   _In_  LPCGUID PowerSettingGuid,
      #   _In_  DWORD Flags )
      attach_function 'RegisterPowerSettingNotification', [:handle, :pointer, DeviceNotifyFlags], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373237(v=vs.85).aspx
      # BOOL WINAPI UnregisterPowerSettingNotification( _In_  HPOWERNOTIFY Handle )
      attach_function 'UnregisterPowerSettingNotification', [:pointer], :bool

      if WindowsVersion >= 8

        # https://msdn.microsoft.com/en-us/library/windows/desktop/jj613321(v=vs.85).aspx
        # HPOWERNOTIFY WINUSERAPI RegisterSuspendResumeNotification(
        #   _In_  PDEVICE_NOTIFY_SUBSCRIBE_PARAMETERS hRecipient,
        #   _In_  DWORD Flags )
        attach_function 'RegisterSuspendResumeNotification', [:pointer, :dword], :pointer

        # https://msdn.microsoft.com/en-us/library/windows/desktop/jj613322(v=vs.85).aspx
        # BOOL WINUSERAPI UnregisterSuspendResumeNotification( _Inout_  HPOWERNOTIFY RegistrationHandle )
        attach_function 'UnregisterSuspendResumeNotification', [:pointer], :bool
      end
    end
  end
end