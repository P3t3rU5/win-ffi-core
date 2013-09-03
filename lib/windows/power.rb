module WinFFI
  module Power
    extend LibBase

    ffi_lib 'user32'

    if WindowsVersion >= :vista

      #HPOWERNOTIFY WINAPI RegisterPowerSettingNotification(
      #  _In_  HANDLE hRecipient,
      #  _In_  LPCGUID PowerSettingGuid,
      #  _In_  DWORD Flags )
      attach_function 'RegisterPowerSettingNotification', [:handle, :pointer, Device::DeviceNotifyFlags], :pointer

      #BOOL WINAPI UnregisterPowerSettingNotification( _In_  HPOWERNOTIFY Handle )
      attach_function 'UnregisterPowerSettingNotification', [:pointer], :bool
      if WindowsVersion >= 8

        #HPOWERNOTIFY WINUSERAPI RegisterSuspendResumeNotification(
        #  _In_  PDEVICE_NOTIFY_SUBSCRIBE_PARAMETERS hRecipient,
        #  _In_  DWORD Flags )
        attach_function 'RegisterSuspendResumeNotification', [:pointer, :dword], :pointer

        #BOOL WINUSERAPI UnregisterSuspendResumeNotification( _Inout_  HPOWERNOTIFY RegistrationHandle )
        attach_function 'UnregisterSuspendResumeNotification', [:pointer], :bool

      end
    end
  end
end