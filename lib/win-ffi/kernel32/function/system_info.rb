require 'win-ffi/kernel32'

require 'win-ffi/kernel32/enum/computer_name_format'
require 'win-ffi/kernel32/struct/os_version_info_ex'

module WinFFI
  module Kernel32
    #BOOL WINAPI DnsHostnameToComputerName(
    #  _In_     LPCTSTR Hostname,
    #  _Out_    LPTSTR ComputerName,
    #  _Inout_  LPDWORD nSize )
    encoded_function 'DnsHostnameToComputerName', [:string, :pointer, :pointer], :bool

    #DWORD WINAPI ExpandEnvironmentStrings(
    #  _In_       LPCTSTR lpSrc,
    #  _Out_opt_  LPTSTR lpDst,
    #  _In_       DWORD nSize )
    encoded_function 'ExpandEnvironmentStrings', [:string, :pointer, :dword], :dword

    #BOOL WINAPI GetComputerName(
    #  _Out_    LPTSTR lpBuffer,
    #  _Inout_  LPDWORD lpnSize )
    encoded_function 'GetComputerName', [:pointer, :pointer], :bool

    #BOOL WINAPI GetComputerNameEx(
    #  _In_     COMPUTER_NAME_FORMAT NameType,
    #  _Out_    LPTSTR lpBuffer,
    #  _Inout_  LPDWORD lpnSize )
    encoded_function 'GetComputerNameEx', [ComputerNameFormat, :pointer, :pointer], :bool

    #UINT WINAPI GetSystemDirectory(
    #  _Out_  LPTSTR lpBuffer,
    #  _In_   UINT uSize )
    encoded_function 'GetSystemDirectory', [:pointer, :uint], :uint

    #void WINAPI GetSystemInfo( _Out_  LPSYSTEM_INFO lpSystemInfo )
    attach_function 'GetSystemInfo', [:pointer], :void

    #UINT WINAPI GetSystemWindowsDirectory(
    #  _Out_  LPTSTR lpBuffer,
    #  _In_   UINT uSize )
    encoded_function 'GetSystemWindowsDirectory', [:pointer, :uint], :uint

    #DWORD WINAPI GetVersion(void)
    attach_function 'GetVersion', [], :dword

    #UINT WINAPI GetWindowsDirectory(
    #  _Out_  LPTSTR lpBuffer,
    #  _In_   UINT uSize )
    encoded_function 'GetWindowsDirectory', [:pointer, :uint], :uint

    #BOOL WINAPI IsProcessorFeaturePresent( _In_  DWORD ProcessorFeature )
    attach_function 'IsProcessorFeaturePresent', [:dword], :bool

    #BOOL WINAPI QueryPerformanceCounter( _Out_  LARGE_INTEGER *lpPerformanceCount )
    attach_function 'QueryPerformanceCounter', [:pointer], :bool

    #BOOL WINAPI QueryPerformanceFrequency( _Out_  LARGE_INTEGER *lpFrequency )
    attach_function 'QueryPerformanceFrequency', [:pointer], :bool

    # The standard character set includes letters, numbers, and the following symbols: ! @ # $ % ^ & ' ) ( . - _ { } ~
    #BOOL WINAPI SetComputerName( _In_  LPCTSTR lpComputerName )
    encoded_function 'SetComputerName', [:string], :bool

    # The name cannot include control characters, leading or trailing spaces, or any of the following characters: " / \ [ ] : | < > + = ; , ?
    #BOOL WINAPI SetComputerNameEx(
    #  _In_  COMPUTER_NAME_FORMAT NameType,
    #  _In_  LPCTSTR lpBuffer )
    encoded_function 'SetComputerNameEx', [:uint, :string], :bool

    #TODO
    #BOOL WINAPI VerifyVersionInfo(
    #  _In_  LPOSVERSIONINFOEX lpVersionInfo,
    #  _In_  DWORD dwTypeMask,
    #  _In_  DWORDLONG dwlConditionMask )
    encoded_function 'VerifyVersionInfo', [OSVERSIONINFOEX.ptr, :dword, :ulong], :bool

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
      encoded_function 'GetSystemWow64Directory', [:pointer, :uint], :uint

      #TODO
      #void WINAPI GetNativeSystemInfo( _Out_  LPSYSTEM_INFO lpSystemInfo )
      attach_function 'GetNativeSystemInfo', [:pointer], :void

      if WindowsVersion.sp >= 1 || WindowsVersion >= :vista
        #DWORD WINAPI GetFirmwareEnvironmentVariable(
        #  _In_   LPCTSTR lpName,
        #  _In_   LPCTSTR lpGuid,
        #  _Out_  PVOID pBuffer,
        #  _In_   DWORD nSize )
        encoded_function 'GetFirmwareEnvironmentVariable', [:string, :string, :pointer, :dword], :dword

        #BOOL WINAPI GetSystemRegistryQuota(
        #  _Out_opt_  PDWORD pdwQuotaAllowed,
        #  _Out_opt_  PDWORD pdwQuotaUsed )
        attach_function 'GetSystemRegistryQuota', [:pointer, :pointer], :bool

        #BOOL WINAPI SetFirmwareEnvironmentVariable(
        #  _In_  LPCTSTR lpName,
        #  _In_  LPCTSTR lpGuid,
        #  _In_  PVOID pBuffer,
        #  _In_  DWORD nSize )
        encoded_function 'SetFirmwareEnvironmentVariable', [:string, :string, :pointer, :dword], :bool
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
          encoded_function 'GetFirmwareEnvironmentVariableEx', [:string, :string, :pointer, :dword, :pointer], :bool

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
          encoded_function 'SetFirmwareEnvironmentVariableEx', [:string, :string, :pointer, :dword, :dword], :bool

        end
      end
    end
  end
end