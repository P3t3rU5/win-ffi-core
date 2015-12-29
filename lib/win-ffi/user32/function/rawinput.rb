require 'win-ffi/user32'

require 'win-ffi/user32/struct/rawinput/rawinput'

module WinFFI
  module User32
    if WindowsVersion >= :xp
      #LRESULT WINAPI DefRawInputProc(
      #  _In_  PRAWINPUT *paRawInput,
      #  _In_  INT nInput,
      #  _In_  UINT cbSizeHeader )
      attach_function 'DefRawInputProc', [:pointer, :int, :uint], :lresult

      # Raw Input Bulk Read: GetRawInputBuffer
      #UINT WINAPI GetRawInputBuffer(
      #  _Out_opt_  PRAWINPUT pData,
      #  _Inout_    PUINT pcbSize,
      #  _In_       UINT cbSizeHeader )
      attach_function 'GetRawInputBuffer', [:pointer, :pointer, :uint], :uint

      #UINT WINAPI GetRawInputData(
      #  _In_       HRAWINPUT hRawInput,
      #  _In_       UINT uiCommand,
      #  _Out_opt_  LPVOID pData,
      #  _Inout_    PUINT pcbSize,
      #  _In_       UINT cbSizeHeader )
      attach_function 'GetRawInputData', [RAWINPUT.ptr, GetRawInputDataFlags, :pointer, :pointer, :uint], :uint

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645597(v=vs.85).aspx
      #UINT WINAPI GetRawInputDeviceInfo(
      #  _In_opt_     HANDLE hDevice,
      #  _In_         UINT uiCommand,
      #  _Inout_opt_  LPVOID pData,
      #  _Inout_      PUINT pcbSize )
      encoded_function 'GetRawInputDeviceInfo', [:handle, RawInputDeviceInformation, :pointer, :pointer], :uint

      #UINT WINAPI GetRawInputDeviceList(
      #  _Out_opt_  PRAWINPUTDEVICELIST pRawInputDeviceList,
      #  _Inout_    PUINT puiNumDevices,
      #  _In_       UINT cbSize )
      attach_function 'GetRawInputDeviceList', [RAWINPUTDEVICELIST.ptr, :pointer, :uint], :uint

      #UINT WINAPI GetRegisteredRawInputDevices(
      #  _Out_opt_  PRAWINPUTDEVICE pRawInputDevices,
      #  _Inout_    PUINT puiNumDevices,
      #  _In_       UINT cbSize )
      attach_function 'GetRegisteredRawInputDevices', [RAWINPUTDEVICELIST.ptr, :pointer, :uint], :uint

      #BOOL WINAPI RegisterRawInputDevices(
      #  _In_  PCRAWINPUTDEVICE pRawInputDevices,
      #  _In_  UINT uiNumDevices,
      #  _In_  UINT cbSize )
      attach_function 'RegisterRawInputDevices', [:pointer , :uint, :uint], :bool
    end
  end
end
