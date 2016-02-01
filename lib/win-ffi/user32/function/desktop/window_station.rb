require 'win-ffi/user32'

require 'win-ffi/user32/enum/user_object_information_flags'

module WinFFI
  module User32

    typedef :pointer, :hwinsta

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682047(v=vs.85).aspx
    # BOOL WINAPI CloseWindowStation( _In_  HWINSTA hWinSta )
    attach_function 'CloseWindowStation', [:hwinsta], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682496(v=vs.85).aspx
    # HWINSTA WINAPI CreateWindowStation(
    #   _In_opt_  LPCTSTR lpwinsta,
    #   DWORD dwFlags,
    #   _In_      ACCESS_MASK dwDesiredAccess,
    #   _In_opt_  LPSECURITY_ATTRIBUTES lpsa )
    encoded_function 'CreateWindowStation', [:string, :dword, DesktopAccessFlags, SECURITY_ATTRIBUTES.ptr], :hwinsta

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682643(v=vs.85).aspx
    # BOOL CALLBACK EnumWindowStationProc(
    #   _In_ LPTSTR lpszWindowStation,
    #   _In_ LPARAM lParam )
    EnumWindowStationProc = callback 'EnumWindowStationProc', [:string, :lparam], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682644(v=vs.85).aspx
    # BOOL WINAPI EnumWindowStations(
    #   _In_  WINSTAENUMPROC lpEnumFunc,
    #   _In_  LPARAM lParam )
    encoded_function 'EnumWindowStations', [EnumWindowStationProc, :lparam], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683225(v=vs.85).aspx
    # HWINSTA WINAPI GetProcessWindowStation(void)
    attach_function 'GetProcessWindowStation', [], :hwinsta

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683238(v=vs.85).aspx
    # BOOL WINAPI GetUserObjectInformation(
    #   _In_       HANDLE hObj,
    #   _In_       int nIndex,
    #   _Out_opt_  PVOID pvInfo,
    #   _In_       DWORD nLength,
    #   _Out_opt_  LPDWORD lpnLengthNeeded )
    encoded_function 'GetUserObjectInformation', [:handle, UserObjectInformationFlags, :pointer, :dword, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684339(v=vs.85).aspx
    # HWINSTA WINAPI OpenWindowStation(
    #   _In_  LPTSTR lpszWinSta,
    #   _In_  BOOL fInherit,
    #   _In_  ACCESS_MASK dwDesiredAccess )
    encoded_function 'OpenWindowStation', [:string, :bool, DesktopAccessFlags], :hwinsta

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686232(v=vs.85).aspx
    # BOOL WINAPI SetProcessWindowStation( _In_  HWINSTA hWinSta )
    attach_function 'SetProcessWindowStation', [:hwinsta], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686287(v=vs.85).aspx
    # BOOL WINAPI SetUserObjectInformation(
    #   _In_  HANDLE hObj,
    #   _In_  int nIndex,
    #   _In_  PVOID pvInfo,
    #   _In_  DWORD nLength )
    encoded_function 'SetUserObjectInformation', [:handle, UserObjectInformationFlags, :pointer, :dword], :bool

    if WindowsVersion >= :xp
      # BOOL WINAPI GetUserObjectSecurity(
      #   _In_        HANDLE                hObj,
      #   _In_        PSECURITY_INFORMATION pSIRequested,
      #   _Inout_opt_ PSECURITY_DESCRIPTOR  pSD,
      #   _In_        DWORD                 nLength,
      #   _Out_       LPDWORD               lpnLengthNeeded)
      attach_function 'GetUserObjectSecurity', [:handle, :pointer, :pointer, :dword, :dword], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa379592(v=vs.85).aspx
      # BOOL WINAPI SetUserObjectSecurity(
      #   _In_ HANDLE                hObj,
      #   _In_ PSECURITY_INFORMATION pSIRequested,
      #   _In_ PSECURITY_DESCRIPTOR  pSID)
      attach_function 'GetUserObjectSecurity', [:handle, :pointer, :pointer], :bool

    end
  end
end