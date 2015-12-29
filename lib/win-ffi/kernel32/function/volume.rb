require 'win-ffi/kernel32'

module WinFFI
  module Kernel32

    #xp
    #BOOL WINAPI DefineDosDevice(
    #_In_      DWORD dwFlags,
    #_In_      LPCTSTR lpDeviceName,
    #_In_opt_  LPCTSTR lpTargetPath )
    encoded_function 'DefineDosDevice', [:dword, :string, :string], :bool

    #BOOL WINAPI DeleteVolumeMountPoint( _In_  LPCTSTR lpszVolumeMountPoint )
    encoded_function 'DeleteVolumeMountPoint', [:string], :bool

    #HANDLE WINAPI FindFirstVolume(
    #  _Out_  LPTSTR lpszVolumeName,
    #  _In_   DWORD cchBufferLength )
    encoded_function 'FindFirstVolume', [:pointer, :dword], :handle

    #HANDLE WINAPI FindFirstVolumeMountPoint(
    #  _In_   LPTSTR lpszRootPathName,
    #  _Out_  LPTSTR lpszVolumeMountPoint,
    #  _In_   DWORD cchBufferLength )
    encoded_function 'FindFirstVolumeMountPoint', [:string, :pointer, :dword], :handle

    #BOOL WINAPI FindNextVolume(
    #  _In_   HANDLE hFindVolume,
    #  _Out_  LPTSTR lpszVolumeName,
    #  _In_   DWORD cchBufferLength )
    encoded_function 'FindNextVolume', [:handle, :pointer, :dword], :bool

    #BOOL WINAPI FindNextVolumeMountPoint(
    #  _In_   HANDLE hFindVolumeMountPoint,
    #  _Out_  LPTSTR lpszVolumeMountPoint,
    #  _In_   DWORD cchBufferLength )
    encoded_function 'FindNextVolumeMountPoint', [:handle, :pointer, :dword], :bool

    #BOOL WINAPI FindVolumeClose( _In_  HANDLE hFindVolume )
    attach_function 'FindVolumeClose', [:handle], :bool

    #BOOL WINAPI FindVolumeMountPointClose( _In_  HANDLE hFindVolumeMountPoint )
    attach_function 'FindVolumeMountPointClose', [:handle], :bool

    #UINT WINAPI GetDriveType( _In_opt_  LPCTSTR lpRootPathName )
    encoded_function 'GetDriveType', [:string], :uint

    #DWORD WINAPI GetLogicalDrives( void )
    attach_function 'GetLogicalDrives', [], :dword

    #DWORD WINAPI GetLogicalDriveStrings(
    #  _In_   DWORD nBufferLength,
    #  _Out_  LPTSTR lpBuffer )
    encoded_function 'GetLogicalDriveStrings', [:dword, :pointer], :dword

    #BOOL WINAPI GetVolumeInformation(
    #  _In_opt_   LPCTSTR lpRootPathName,
    #  _Out_opt_  LPTSTR lpVolumeNameBuffer,
    #  _In_       DWORD nVolumeNameSize,
    #  _Out_opt_  LPDWORD lpVolumeSerialNumber,
    #  _Out_opt_  LPDWORD lpMaximumComponentLength,
    #  _Out_opt_  LPDWORD lpFileSystemFlags,
    #  _Out_opt_  LPTSTR lpFileSystemNameBuffer,
    #  _In_       DWORD nFileSystemNameSize )
    encoded_function 'GetVolumeInformation', [:string, :pointer, :dword, :pointer, :pointer, :pointer, :pointer, :dword], :bool

    #BOOL WINAPI GetVolumeNameForVolumeMountPoint(
    #  _In_   LPCTSTR lpszVolumeMountPoint,
    #  _Out_  LPTSTR lpszVolumeName,
    #  _In_   DWORD cchBufferLength )
    encoded_function 'GetVolumeNameForVolumeMountPoint', [:string, :pointer, :dword], :bool

    #BOOL WINAPI GetVolumePathName(
    #  _In_   LPCTSTR lpszFileName,
    #  _Out_  LPTSTR lpszVolumePathName,
    #  _In_   DWORD cchBufferLength )
    encoded_function 'GetVolumePathName', [:string, :pointer, :dword], :bool

    #BOOL WINAPI GetVolumePathNamesForVolumeName(
    #  _In_   LPCTSTR lpszVolumeName,
    #  _Out_  LPTSTR lpszVolumePathNames,
    #  _In_   DWORD cchBufferLength,
    #  _Out_  PDWORD lpcchReturnLength )
    encoded_function 'GetVolumePathNamesForVolumeName', [:string, :pointer, :dword, :pointer], :bool

    #DWORD WINAPI QueryDosDevice(
    #  _In_opt_  LPCTSTR lpDeviceName,
    #  _Out_     LPTSTR lpTargetPath,
    #  _In_      DWORD ucchMax )
    encoded_function 'QueryDosDevice', [:string, :pointer, :dword], :dword

    #BOOL WINAPI SetVolumeLabel(
    #  _In_opt_  LPCTSTR lpRootPathName,
    #  _In_opt_  LPCTSTR lpVolumeName )
    encoded_function 'SetVolumeLabel', [:string, :string], :bool

    #BOOL WINAPI SetVolumeMountPoint(Cl
    #  _In_  LPCTSTR lpszVolumeMountPoint,
    #  _In_  LPCTSTR lpszVolumeName )
    encoded_function 'SetVolumeMountPoint', [:string, :string], :bool

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