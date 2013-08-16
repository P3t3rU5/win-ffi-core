module WinFFI
  module User32
    module RawInput
      extend LibBase

      ffi_lib 'user32'

      RIM = enum :rim, [
          :TYPEMOUSE, 0, # The device is a mouse.
          :TYPEKEYBOARD, 1, # The device is a keyboard.
          :TYPEHID, 2, # The device is an HID that is not a keyboard and not a mouse.
      ]

      class RAWINPUTDEVICELIST < FFI::Struct
        layout :hDevice, :handle,
               :dwType,  RIM
      end

      class RAWINPUTHEADER < FFI::Struct
        layout :dwType,   :dword,
               :dwSize,   :dword,
               :hDevice,  :handle,
               :wParam,   :wparam
      end

      #TODO RAWINPUT struct

      #LRESULT WINAPI DefRawInputProc(
      #  _In_  PRAWINPUT *paRawInput,
      #  _In_  INT nInput,
      #  _In_  UINT cbSizeHeader )
      attach_function 'DefRawInputProc', [:pointer, :int, :uint], :lresult

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
      attach_function 'GetRawInputData', [:pointer, :uint, :pointer, :pointer, :uint], :uint

      #UINT WINAPI GetRawInputDeviceInfo(
      #  _In_opt_     HANDLE hDevice,
      #  _In_         UINT uiCommand,
      #  _Inout_opt_  LPVOID pData,
      #  _Inout_      PUINT pcbSize )
      attach_function 'GetRawInputDeviceInfoA', [:handle, :uint, :pointer, :pointer], :uint
      attach_function 'GetRawInputDeviceInfoW', [:handle, :uint, :pointer, :pointer], :uint

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