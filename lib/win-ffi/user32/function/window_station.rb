require 'win-ffi/user32'

module WinFFI
  module User32

    typedef :pointer, :hwinsta

    #BOOL WINAPI CloseWindowStation( _In_  HWINSTA hWinSta )
    attach_function 'CloseWindowStation', [:hwinsta], :bool

    #HWINSTA WINAPI CreateWindowStation(
    #  _In_opt_  LPCTSTR lpwinsta,
    #  DWORD dwFlags,
    #  _In_      ACCESS_MASK dwDesiredAccess,
    #  _In_opt_  LPSECURITY_ATTRIBUTES lpsa )
    encoded_function 'CreateWindowStation', [:string, :dword, DesktopAccessFlags, SECURITY_ATTRIBUTES.ptr], :hwinsta

    # BOOL CALLBACK EnumWindowStationProc(
    # _In_ LPTSTR lpszWindowStation,
    # _In_ LPARAM lParam )
    EnumWindowStationProc = callback 'EnumWindowStationProc', [:string, :lparam], :bool

    #BOOL WINAPI EnumWindowStations(
    #  _In_  WINSTAENUMPROC lpEnumFunc,
    #  _In_  LPARAM lParam )
    encoded_function 'EnumWindowStations', [EnumWindowStationProc, :lparam], :bool

    #HWINSTA WINAPI GetProcessWindowStation(void)
    attach_function 'GetProcessWindowStation', [], :hwinsta


    #HWINSTA WINAPI OpenWindowStation(
    #  _In_  LPTSTR lpszWinSta,
    #  _In_  BOOL fInherit,
    #  _In_  ACCESS_MASK dwDesiredAccess )
    encoded_function 'OpenWindowStation', [:string, :bool, DesktopAccessFlags], :hwinsta

    #BOOL WINAPI SetProcessWindowStation( _In_  HWINSTA hWinSta )
    attach_function 'SetProcessWindowStation', [:hwinsta], :bool
  end
end