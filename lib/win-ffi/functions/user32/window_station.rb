require 'win-ffi/functions/user32'

module WinFFI
  module User32
    #BOOL WINAPI CloseWindowStation( _In_  HWINSTA hWinSta )
    attach_function 'CloseWindowStation', [:hwinsta], :bool

    #HWINSTA WINAPI CreateWindowStation(
    #  _In_opt_  LPCTSTR lpwinsta,
    #  DWORD dwFlags,
    #  _In_      ACCESS_MASK dwDesiredAccess,
    #  _In_opt_  LPSECURITY_ATTRIBUTES lpsa )
    attach_function 'CreateWindowStationA', [:string, :dword, :int, :pointer], :hwinsta
    attach_function 'CreateWindowStationW', [:string, :dword, :int, :pointer], :hwinsta

    #BOOL WINAPI EnumWindowStations(
    #  _In_  WINSTAENUMPROC lpEnumFunc,
    #  _In_  LPARAM lParam )
    #attach_function 'EnumWindowStations', [:pointer, :lparam], :bool

    #HWINSTA WINAPI GetProcessWindowStation(void)
    attach_function 'GetProcessWindowStation', [], :hwinsta

    #BOOL CALLBACK EnumDesktopProc(
    #  _In_  LPTSTR lpszWindowStation,
    #  _In_  LPARAM lParam )
    callback 'EnumDesktopProc', [:string, :lparam], :bool

    #HWINSTA WINAPI OpenWindowStation(
    #  _In_  LPTSTR lpszWinSta,
    #  _In_  BOOL fInherit,
    #  _In_  ACCESS_MASK dwDesiredAccess )
    attach_function 'OpenWindowStationA', [:string, :bool, :pointer], :hwinsta
    attach_function 'OpenWindowStationW', [:string, :bool, :pointer], :hwinsta

    #BOOL WINAPI SetProcessWindowStation( _In_  HWINSTA hWinSta )
    attach_function 'SetProcessWindowStation', [:hwinsta], :bool
  end
end