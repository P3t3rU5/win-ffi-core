require 'win-ffi/user32'

require 'win-ffi/user32/enum/get_dc_ex_flags'

require 'win-ffi/user32/struct/display_device'

module WinFFI
  module User32
    #LONG ChangeDisplaySettings(
    #  _In_  DEVMODE *lpDevMode,
    #  _In_  DWORD dwflags )
    encoded_function 'ChangeDisplaySettings', [:pointer, :dword], :long

    #LONG ChangeDisplaySettingsEx(
    #  _In_  LPCTSTR lpszDeviceName,
    #  _In_  DEVMODE *lpDevMode,
    #  HWND hwnd,
    #  _In_  DWORD dwflags,
    #  _In_  LPVOID lParam )
    encoded_function 'ChangeDisplaySettingsEx', [:string, :pointer, :hwnd, :dword, :pointer], :long

    #BOOL EnumDisplayDevices(
    #  _In_   LPCTSTR lpDevice,
    #  _In_   DWORD iDevNum,
    #  _Out_  PDISPLAY_DEVICE lpDisplayDevice,
    #  _In_   DWORD dwFlags )
    encoded_function 'EnumDisplayDevices', [:pointer, :dword, DISPLAY_DEVICE.ptr, :dword], :bool

    #BOOL EnumDisplaySettings(
    #  _In_   LPCTSTR lpszDeviceName,
    #  _In_   DWORD iModeNum,
    #  _Out_  DEVMODE *lpDevMode )
    encoded_function 'EnumDisplaySettings', [:string, :dword, :pointer], :bool

    #BOOL EnumDisplaySettingsEx(
    #  _In_   LPCTSTR lpszDeviceName,
    #  _In_   DWORD iModeNum,
    #  _Out_  DEVMODE *lpDevMode,
    #  _In_   DWORD dwFlags )
    encoded_function 'EnumDisplaySettingsEx', [:string, :dword, :pointer, :dword], :bool

    #HDC GetDC( _In_  HWND hWnd )
    attach_function 'GetDC', [:hwnd], :hdc

    #HDC GetDCEx(
    #  _In_  HWND hWnd,
    #  _In_  HRGN hrgnClip,
    #  _In_  DWORD flags )
    attach_function 'GetDCEx', [:hwnd, :hrgn, GetDCExFlags], :hdc

    #int ReleaseDC(
    #  _In_  HWND hWnd,
    #  _In_  HDC hDC )
    attach_function 'ReleaseDC', [:hwnd, :hdc], :int

    #HWND WindowFromDC( _In_  HDC hDC )
    attach_function 'WindowFromDC', [:hdc], :hwnd
  end
end