module WinFFI
  module Kernel32

    #xp
    #BOOL WINAPI DefineDosDevice(
    #_In_      DWORD dwFlags,
    #_In_      LPCTSTR lpDeviceName,
    #_In_opt_  LPCTSTR lpTargetPath )
    attach_function 'DefineDosDeviceA', [:dword, :string, :string], :bool
    attach_function 'DefineDosDeviceW', [:dword, :string, :string], :bool

    #BOOL WINAPI DeleteVolumeMountPoint( _In_  LPCTSTR lpszVolumeMountPoint )
    attach_function 'DeleteVolumeMountPointA', [:string], :bool
    attach_function 'DeleteVolumeMountPointW', [:string], :bool

    #HANDLE WINAPI FindFirstVolume(
    #  _Out_  LPTSTR lpszVolumeName,
    #  _In_   DWORD cchBufferLength )
    attach_function 'FindFirstVolumeA', [:pointer, :dword], :handle
    attach_function 'FindFirstVolumeW', [:pointer, :dword], :handle

    #HANDLE WINAPI FindFirstVolumeMountPoint(
    #  _In_   LPTSTR lpszRootPathName,
    #  _Out_  LPTSTR lpszVolumeMountPoint,
    #  _In_   DWORD cchBufferLength )
    attach_function 'FindFirstVolumeMountPointA', [:string, :pointer, :dword], :handle
    attach_function 'FindFirstVolumeMountPointW', [:string, :pointer, :dword], :handle

    #BOOL WINAPI FindNextVolume(
    #  _In_   HANDLE hFindVolume,
    #  _Out_  LPTSTR lpszVolumeName,
    #  _In_   DWORD cchBufferLength )
    attach_function 'FindNextVolumeA', [:handle, :pointer, :dword], :bool
    attach_function 'FindNextVolumeW', [:handle, :pointer, :dword], :bool

    #BOOL WINAPI FindNextVolumeMountPoint(
    #  _In_   HANDLE hFindVolumeMountPoint,
    #  _Out_  LPTSTR lpszVolumeMountPoint,
    #  _In_   DWORD cchBufferLength )
    attach_function 'FindNextVolumeMountPointA', [:handle, :pointer, :dword], :bool
    attach_function 'FindNextVolumeMountPointW', [:handle, :pointer, :dword], :bool

    #BOOL WINAPI FindVolumeClose( _In_  HANDLE hFindVolume )
    attach_function 'FindVolumeClose', [:handle], :bool

    #BOOL WINAPI FindVolumeMountPointClose( _In_  HANDLE hFindVolumeMountPoint )
    attach_function 'FindVolumeMountPointClose', [:handle], :bool

    #UINT WINAPI GetDriveType( _In_opt_  LPCTSTR lpRootPathName )
    attach_function 'GetDriveTypeA', [:string], :uint
    attach_function 'GetDriveTypeW', [:string], :uint

    #DWORD WINAPI GetLogicalDrives( void )
    attach_function 'GetLogicalDrives', [], :dword

    #DWORD WINAPI GetLogicalDriveStrings(
    #  _In_   DWORD nBufferLength,
    #  _Out_  LPTSTR lpBuffer )
    attach_function 'GetLogicalDriveStringsA', [:dword, :pointer], :dword
    attach_function 'GetLogicalDriveStringsW', [:dword, :pointer], :dword

    #BOOL WINAPI GetVolumeInformation(
    #  _In_opt_   LPCTSTR lpRootPathName,
    #  _Out_opt_  LPTSTR lpVolumeNameBuffer,
    #  _In_       DWORD nVolumeNameSize,
    #  _Out_opt_  LPDWORD lpVolumeSerialNumber,
    #  _Out_opt_  LPDWORD lpMaximumComponentLength,
    #  _Out_opt_  LPDWORD lpFileSystemFlags,
    #  _Out_opt_  LPTSTR lpFileSystemNameBuffer,
    #  _In_       DWORD nFileSystemNameSize )
    attach_function 'GetVolumeInformationA', [:string, :pointer, :dword, :pointer, :pointer, :pointer, :pointer, :dword], :bool
    attach_function 'GetVolumeInformationW', [:string, :pointer, :dword, :pointer, :pointer, :pointer, :pointer, :dword], :bool

    #BOOL WINAPI GetVolumeNameForVolumeMountPoint(
    #  _In_   LPCTSTR lpszVolumeMountPoint,
    #  _Out_  LPTSTR lpszVolumeName,
    #  _In_   DWORD cchBufferLength )
    attach_function 'GetVolumeNameForVolumeMountPointA', [:string, :pointer, :dword], :bool
    attach_function 'GetVolumeNameForVolumeMountPointW', [:string, :pointer, :dword], :bool

    #BOOL WINAPI GetVolumePathName(
    #  _In_   LPCTSTR lpszFileName,
    #  _Out_  LPTSTR lpszVolumePathName,
    #  _In_   DWORD cchBufferLength )
    attach_function 'GetVolumePathNameA', [:string, :pointer, :dword], :bool
    attach_function 'GetVolumePathNameW', [:string, :pointer, :dword], :bool

    #BOOL WINAPI GetVolumePathNamesForVolumeName(
    #  _In_   LPCTSTR lpszVolumeName,
    #  _Out_  LPTSTR lpszVolumePathNames,
    #  _In_   DWORD cchBufferLength,
    #  _Out_  PDWORD lpcchReturnLength )
    attach_function 'GetVolumePathNamesForVolumeNameA', [:string, :pointer, :dword, :pointer], :bool
    attach_function 'GetVolumePathNamesForVolumeNameW', [:string, :pointer, :dword, :pointer], :bool

    #DWORD WINAPI QueryDosDevice(
    #  _In_opt_  LPCTSTR lpDeviceName,
    #  _Out_     LPTSTR lpTargetPath,
    #  _In_      DWORD ucchMax )
    attach_function 'QueryDosDeviceA', [:string, :pointer, :dword], :dword
    attach_function 'QueryDosDeviceW', [:string, :pointer, :dword], :dword

    #BOOL WINAPI SetVolumeLabel(
    #  _In_opt_  LPCTSTR lpRootPathName,
    #  _In_opt_  LPCTSTR lpVolumeName )
    attach_function 'SetVolumeLabelA', [:string, :string], :bool
    attach_function 'SetVolumeLabelW', [:string, :string], :bool

    #BOOL WINAPI SetVolumeMountPoint(Cl
    #  _In_  LPCTSTR lpszVolumeMountPoint,
    #  _In_  LPCTSTR lpszVolumeName )
    attach_function 'SetVolumeMountPointA', [:string, :string], :bool
    attach_function 'SetVolumeMountPointW', [:string, :string], :bool

    if WindowsVersion >= :vista
      #BOOL WINAPI GetVolumeInformationByHandleW(
      #  _In_       HANDLE hFile,
      #  _Out_opt_  LPWSTR lpVolumeNameBuffer,
      #  _In_       DWORD nVolumeNameSize,
      #  _Out_opt_  LPDWORD lpVolumeSerialNumber,
      #  _Out_opt_  LPDWORD lpMaximumComponentLength,
      #  _Out_opt_  LPDWORD lpFileSystemFlags,
      #  _Out_opt_  LPWSTR lpFileSystemNameBuffer,
      #  _In_       DWORD nFileSystemNameSize )
      attach_function 'GetVolumeInformationByHandleW', [:handle, :pointer, :dword, :pointer, :pointer, :pointer, :pointer, :dword], :bool
    end
  end
end