require_relative '../../structs/user32/display_device'

module WinFFI
  module User32
    #LONG ChangeDisplaySettings(
    #  _In_  DEVMODE *lpDevMode,
    #  _In_  DWORD dwflags )
    attach_function 'ChangeDisplaySettingsA', [:pointer, :dword], :long
    attach_function 'ChangeDisplaySettingsW', [:pointer, :dword], :long

    #LONG ChangeDisplaySettingsEx(
    #  _In_  LPCTSTR lpszDeviceName,
    #  _In_  DEVMODE *lpDevMode,
    #  HWND hwnd,
    #  _In_  DWORD dwflags,
    #  _In_  LPVOID lParam )
    attach_function 'ChangeDisplaySettingsExA', [:string, :pointer, :hwnd, :dword, :pointer], :long
    attach_function 'ChangeDisplaySettingsExW', [:string, :pointer, :hwnd, :dword, :pointer], :long

    #BOOL EnumDisplayDevices(
    #  _In_   LPCTSTR lpDevice,
    #  _In_   DWORD iDevNum,
    #  _Out_  PDISPLAY_DEVICE lpDisplayDevice,
    #  _In_   DWORD dwFlags )
    attach_function 'EnumDisplayDevicesA', [:pointer, :dword, DISPLAY_DEVICE.ptr, :dword], :bool
    attach_function 'EnumDisplayDevicesW', [:pointer, :dword, DISPLAY_DEVICE.ptr, :dword], :bool

    #BOOL EnumDisplaySettings(
    #  _In_   LPCTSTR lpszDeviceName,
    #  _In_   DWORD iModeNum,
    #  _Out_  DEVMODE *lpDevMode )
    attach_function 'EnumDisplaySettingsA', [:string, :dword, :pointer], :bool
    attach_function 'EnumDisplaySettingsW', [:string, :dword, :pointer], :bool

    #BOOL EnumDisplaySettingsEx(
    #  _In_   LPCTSTR lpszDeviceName,
    #  _In_   DWORD iModeNum,
    #  _Out_  DEVMODE *lpDevMode,
    #  _In_   DWORD dwFlags )
    attach_function 'EnumDisplaySettingsExA', [:string, :dword, :pointer, :dword], :bool
    attach_function 'EnumDisplaySettingsExW', [:string, :dword, :pointer, :dword], :bool

    #HDC GetDC( _In_  HWND hWnd )
    attach_function 'GetDC', [:hwnd], :hdc

    #HDC GetDCEx(
    #  _In_  HWND hWnd,
    #  _In_  HRGN hrgnClip,
    #  _In_  DWORD flags )
    attach_function 'GetDCEx', [:hwnd, :hrgn, :dword], :hdc

    #int ReleaseDC(
    #  _In_  HWND hWnd,
    #  _In_  HDC hDC )
    attach_function 'ReleaseDC', [:hwnd, :hdc], :int

    #HWND WindowFromDC( _In_  HDC hDC )
    attach_function 'WindowFromDC', [:hdc], :hwnd
  end
end