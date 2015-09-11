require 'win-ffi/functions/kernel32'

require 'win-ffi/enums/computer_name_format'

module WinFFI
  module Kernel32
    #BOOL WINAPI DnsHostnameToComputerName(
    #  _In_     LPCTSTR Hostname,
    #  _Out_    LPTSTR ComputerName,
    #  _Inout_  LPDWORD nSize )
    attach_function 'DnsHostnameToComputerNameA', [:string, :pointer, :pointer], :bool
    attach_function 'DnsHostnameToComputerNameW', [:string, :pointer, :pointer], :bool

    #DWORD WINAPI ExpandEnvironmentStrings(
    #  _In_       LPCTSTR lpSrc,
    #  _Out_opt_  LPTSTR lpDst,
    #  _In_       DWORD nSize )
    attach_function 'ExpandEnvironmentStringsA', [:string, :pointer, :dword], :dword
    attach_function 'ExpandEnvironmentStringsW', [:string, :pointer, :dword], :dword

    #BOOL WINAPI GetComputerName(
    #  _Out_    LPTSTR lpBuffer,
    #  _Inout_  LPDWORD lpnSize )
    attach_function 'GetComputerNameA', [:pointer, :pointer], :bool
    attach_function 'GetComputerNameW', [:pointer, :pointer], :bool

    #BOOL WINAPI GetComputerNameEx(
    #  _In_     COMPUTER_NAME_FORMAT NameType,
    #  _Out_    LPTSTR lpBuffer,
    #  _Inout_  LPDWORD lpnSize )
    attach_function 'GetComputerNameExA', [ComputerNameFormat, :pointer, :pointer], :bool
    attach_function 'GetComputerNameExW', [ComputerNameFormat, :pointer, :pointer], :bool

    #UINT WINAPI GetSystemDirectory(
    #  _Out_  LPTSTR lpBuffer,
    #  _In_   UINT uSize )
    attach_function 'GetSystemDirectoryA', [:pointer, :uint], :uint
    attach_function 'GetSystemDirectoryW', [:pointer, :uint], :uint

    #void WINAPI GetSystemInfo( _Out_  LPSYSTEM_INFO lpSystemInfo )
    attach_function 'GetSystemInfo', [:pointer], :void

    #UINT WINAPI GetSystemWindowsDirectory(
    #  _Out_  LPTSTR lpBuffer,
    #  _In_   UINT uSize )
    attach_function 'GetSystemWindowsDirectoryA', [:pointer, :uint], :uint
    attach_function 'GetSystemWindowsDirectoryW', [:pointer, :uint], :uint

    #DWORD WINAPI GetVersion(void)
    attach_function 'GetVersion', [], :dword

    #UINT WINAPI GetWindowsDirectory(
    #  _Out_  LPTSTR lpBuffer,
    #  _In_   UINT uSize )
    attach_function 'GetWindowsDirectoryA', [:pointer, :uint], :uint
    attach_function 'GetWindowsDirectoryW', [:pointer, :uint], :uint

    #BOOL WINAPI IsProcessorFeaturePresent( _In_  DWORD ProcessorFeature )
    attach_function 'IsProcessorFeaturePresent', [:dword], :bool

    #BOOL WINAPI QueryPerformanceCounter( _Out_  LARGE_INTEGER *lpPerformanceCount )
    attach_function 'QueryPerformanceCounter', [:pointer], :bool

    #BOOL WINAPI QueryPerformanceFrequency( _Out_  LARGE_INTEGER *lpFrequency )
    attach_function 'QueryPerformanceFrequency', [:pointer], :bool

    # The standard character set includes letters, numbers, and the following symbols: ! @ # $ % ^ & ' ) ( . - _ { } ~
    #BOOL WINAPI SetComputerName( _In_  LPCTSTR lpComputerName )
    attach_function 'SetComputerNameA', [:string], :bool
    attach_function 'SetComputerNameW', [:string], :bool

    # The name cannot include control characters, leading or trailing spaces, or any of the following characters: " / \ [ ] : | < > + = ; , ?
    #BOOL WINAPI SetComputerNameEx(
    #  _In_  COMPUTER_NAME_FORMAT NameType,
    #  _In_  LPCTSTR lpBuffer )
    attach_function 'SetComputerNameExA', [:uint, :string], :bool
    attach_function 'SetComputerNameExW', [:uint, :string], :bool

    #TODO
    #BOOL WINAPI VerifyVersionInfo(
    #  _In_  LPOSVERSIONINFOEX lpVersionInfo,
    #  _In_  DWORD dwTypeMask,
    #  _In_  DWORDLONG dwlConditionMask )
    attach_function 'VerifyVersionInfoA', [OSVERSIONINFOEX.ptr, :dword, :ulong], :bool
    attach_function 'VerifyVersionInfoW', [OSVERSIONINFOEX.ptr, :dword, :ulong], :bool

    #TODO
    #ULONGLONG WINAPI VerSetConditionMask(
    #  _In_  ULONGLONG dwlConditionMask,
    #  _In_  DWORD dwTypeBitMask,
    #  _In_  BYTE dwConditionMask )
    attach_function 'VerSetConditionMask', [:ulong, :dword, :byte], :ulong

    if WindowsVersion >= :xp

      #UINT WINAPI GetSystemWow64Directory(
      #  _Out_  LPTSTR lpBuffer,
      #  _In_   UINT uSize )
      attach_function 'GetSystemWow64DirectoryA', [:pointer, :uint], :uint
      attach_function 'GetSystemWow64DirectoryW', [:pointer, :uint], :uint

      #TODO
      #void WINAPI GetNativeSystemInfo( _Out_  LPSYSTEM_INFO lpSystemInfo )
      attach_function 'GetNativeSystemInfo', [:pointer], :void

      if WindowsVersion.sp >= 1 || WindowsVersion >= :vista
        #DWORD WINAPI GetFirmwareEnvironmentVariable(
        #  _In_   LPCTSTR lpName,
        #  _In_   LPCTSTR lpGuid,
        #  _Out_  PVOID pBuffer,
        #  _In_   DWORD nSize )
        attach_function 'GetFirmwareEnvironmentVariableA', [:string, :string, :pointer, :dword], :dword
        attach_function 'GetFirmwareEnvironmentVariableW', [:string, :string, :pointer, :dword], :dword

        #BOOL WINAPI GetSystemRegistryQuota(
        #  _Out_opt_  PDWORD pdwQuotaAllowed,
        #  _Out_opt_  PDWORD pdwQuotaUsed )
        attach_function 'GetSystemRegistryQuota', [:pointer, :pointer], :bool

        #BOOL WINAPI SetFirmwareEnvironmentVariable(
        #  _In_  LPCTSTR lpName,
        #  _In_  LPCTSTR lpGuid,
        #  _In_  PVOID pBuffer,
        #  _In_  DWORD nSize )
        attach_function 'SetFirmwareEnvironmentVariableA', [:string, :string, :pointer, :dword], :bool
        attach_function 'SetFirmwareEnvironmentVariableW', [:string, :string, :pointer, :dword], :bool
      end

      #x64
      #UINT WINAPI EnumSystemFirmwareTables(
      #  _In_   DWORD FirmwareTableProviderSignature,
      #  _Out_  PVOID pFirmwareTableBuffer,
      #  _In_   DWORD BufferSize )
      attach_function 'EnumSystemFirmwareTables', [:dword, :pointer, :dword], :uint

      #UINT WINAPI GetSystemFirmwareTable(
      #  _In_   DWORD FirmwareTableProviderSignature,
      #  _In_   DWORD FirmwareTableID,
      #  _Out_  PVOID pFirmwareTableBuffer,
      #  _In_   DWORD BufferSize )
      attach_function 'GetSystemFirmwareTable', [:dword, :dword, :pointer, :dword], :uint

      if WindowsVersion >= :vista

        #BOOL WINAPI GetProductInfo(
        #  _In_   DWORD dwOSMajorVersion,
        #  _In_   DWORD dwOSMinorVersion,
        #  _In_   DWORD dwSpMajorVersion,
        #  _In_   DWORD dwSpMinorVersion,
        #  _Out_  PDWORD pdwReturnedProductType )
        attach_function 'GetProductInfo', [:dword, :dword, :dword, :dword, :pointer], :bool

        if WindowsVersion >= 8

          #BOOL WINBASEAPI GetFirmwareEnvironmentVariableEx(
          #  LPCSTR lpName,
          #  LPCSTR lpGuid,
          #  PVOID pValue,
          #  DWORD nSize,
          #  PDWORD pdwAttributes )
          attach_function 'GetFirmwareEnvironmentVariableExA', [:string, :string, :pointer, :dword, :pointer], :bool
          attach_function 'GetFirmwareEnvironmentVariableExW', [:string, :string, :pointer, :dword, :pointer], :bool

          #BOOL WINAPI GetFirmwareType( _Inout_  PFIRMWARE_TYPE FirmwareType )
          attach_function 'GetFirmwareType', [:pointer], :bool

          #BOOL WINAPI IsNativeVhdBoot ( _Out_  PBOOL *NativeVhdBoot )
          attach_function 'IsNativeVhdBoot', [:pointer], :bool

          #BOOL WINBASEAPI SetFirmwareEnvironmentVariableEx(
          #  _In_  LPCTSTR lpName,
          #  _In_  LPCTSTR lpGuid,
          #  _In_  PVOID pValue,
          #  _In_  DWORD nSize,
          #  _In_  DWORD dwAttributes )
          attach_function 'SetFirmwareEnvironmentVariableExA', [:string, :string, :pointer, :dword, :dword], :bool
          attach_function 'SetFirmwareEnvironmentVariableExW', [:string, :string, :pointer, :dword, :dword], :bool

        end
      end
    end
  end
end