module WinFFI
  module SystemInfo
    extend LibBase

    ffi_lib 'kernel32'

    # Obsolete processor info constants

    PROCESSOR_INTEL_386     = 386
    PROCESSOR_INTEL_486     = 486
    PROCESSOR_INTEL_PENTIUM = 586
    PROCESSOR_INTEL_IA64    = 2200
    PROCESSOR_AMD_X8664     = 8664

    # Suite mask constants
    #VersionSuitMask = enum :version_suit_mask, [
    #
    #]
    VER_SERVER_NT                      = 0x80000000
    VER_WORKSTATION_NT                 = 0x40000000
    VER_SUITE_SMALLBUSINESS            = 0x00000001
    VER_SUITE_ENTERPRISE               = 0x00000002
    VER_SUITE_BACKOFFICE               = 0x00000004
    VER_SUITE_COMMUNICATIONS           = 0x00000008
    VER_SUITE_TERMINAL                 = 0x00000010
    VER_SUITE_SMALLBUSINESS_RESTRICTED = 0x00000020
    VER_SUITE_EMBEDDEDNT               = 0x00000040
    VER_SUITE_DATACENTER               = 0x00000080
    VER_SUITE_SINGLEUSERTS             = 0x00000100
    VER_SUITE_PERSONAL                 = 0x00000200
    VER_SUITE_BLADE                    = 0x00000400
    VER_SUITE_EMBEDDED_RESTRICTED      = 0x00000800
    VER_SUITE_SECURITY_APPLIANCE       = 0x00001000
    VER_SUITE_STORAGE_SERVER           = 0x00002000
    VER_SUITE_COMPUTE_SERVER           = 0x00004000

    # Product mask constants

    VER_NT_WORKSTATION       = 0x0000001
    VER_NT_DOMAIN_CONTROLLER = 0x0000002
    VER_NT_SERVER            = 0x0000003

    # Platform definitions

    VER_PLATFORM_WIN32s        = 0
    VER_PLATFORM_WIN32_WINDOWS = 1
    VER_PLATFORM_WIN32_NT      = 2

    # Version info type constants

    VER_MINORVERSION     = 0x0000001
    VER_MAJORVERSION     = 0x0000002
    VER_BUILDNUMBER      = 0x0000004
    VER_PLATFORMID       = 0x0000008
    VER_SERVICEPACKMINOR = 0x0000010
    VER_SERVICEPACKMAJOR = 0x0000020
    VER_SUITENAME        = 0x0000040
    VER_PRODUCT_TYPE     = 0x0000080

    # Enum COMPUTER_NAME_FORMAT
    ComputerNameFormat = enum :computer_name_format, [
        :NetBIOS,                   0,
        :DnsHostname,               1,
        :DnsDomain,                 2,
        :DnsFullyQualified,         3,
        :PhysicalNetBIOS,           4,
        :PhysicalDnsHostname,       5,
        :PhysicalDnsDomain,         6,
        :PhysicalDnsFullyQualified, 7,
        :Max,                       8
    ]

    ExtendedNameFormat = enum :extended_name_format, [
        :Unknown,          0,
        :FullyQualifiedDN, 1,
        :SamCompatible,    2,
        :Display,          3,
        :UniqueId,         6,
        :Canonical,        7,
        :UserPrincipal,    8,
        :CanonicalEx,      9,
        :ServicePrincipal, 10,
        :DnsDomain,        12
    ]

    FirmwareType = enum :firmware_type, [
        :Unknown, 0,
        :Bios,    1,
        :Uefi,    2,
        :Max,     3
    ]

    #BOOL WINAPI GetVersionEx( _Inout_  LPOSVERSIONINFO lpVersionInfo )
    attach_function 'GetVersionExA', [:pointer], :bool
    attach_function 'GetVersionExW', [:pointer], :bool


    class OSVERSIONINFO < FFI::Struct
      layout :dwOSVersionInfoSize, :ulong,
             :dwMajorVersion,      :ulong,
             :dwMinorVersion,      :ulong,
             :dwBuildNumber,       :ulong,
             :dwPlatformId,        :ulong,
             :szCSDVersion,        [:char, 128]
    end

    class OSVERSIONINFOEX < FFI::Struct
      layout :dwOSVersionInfoSize, :ulong,
             :dwMajorVersion,      :ulong,
             :dwMinorVersion,      :ulong,
             :dwBuildNumber,       :ulong,
             :dwPlatformId,        :ulong,
             :szCSDVersion,        [:char, 128],
             :wServicePackMajor,   :ushort,
             :wServicePackMinor,   :ushort,
             :wSuiteMask,          :ushort,
             :wProductType,        :uchar,
             :wReserved,           :uchar

      def get!
        tap do |ovi|
          ovi[:dwOSVersionInfoSize] = size
          SystemInfo::GetVersionExA(ovi)
        end
      end

      def major; self[:dwMajorVersion] end
      def minor; self[:dwMinorVersion] end
      def build; self[:dwBuildNumber]  end
      def sp; self[:wServicePackMajor] end

      def hex; (major << 8) + minor end

      def <=>(version)
        hex <=> case version
                  when '2000', 2000    then 0x0500
                  when 'xp', :xp       then 0x0501
                  when 'vista', :vista then 0x0600
                  when '7', 7;         then 0x0601
                  when '8', 8;         then 0x0602
                  when '8.1', 8.1;     then 0x0603
                  else raise ArgumentError, 'Unknown Version'
                end
      end

      include Comparable

      def name
        case hex
          when 0x0500...0x0501; 'Windows 2000'
          when 0x0501...0x0600; 'Windows XP'
          when 0x0600...0x0601; 'Windows Vista'
          when 0x0601; 'Windows 7'
          when 0x0602; 'Windows 8'
          when 0x0603; 'Windows 8.1'
          else 'Unknown'
        end
      end

      def to_s; "#{major}.#{minor}.#{build} SP#{sp} (#{name})" end
    end
  end

  WindowsVersion = SystemInfo::OSVERSIONINFOEX.new.get!

  puts "WinFFI #{WinFFI::VERSION}"
  puts WinFFI::WindowsVersion

  module SystemInfo

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

    ffi_lib 'Ntdll'

    #NTSTATUS WINAPI NtQuerySystemInformation(
    #  _In_       SYSTEM_INFORMATION_CLASS SystemInformationClass,
    #  _Inout_    PVOID SystemInformation,
    #  _In_       ULONG SystemInformationLength,
    #  _Out_opt_  PULONG ReturnLength )
    attach_function 'NtQuerySystemInformation', [:pointer, :pointer, :ulong, :pointer], :int

    ffi_lib 'advapi32'

    #BOOL WINAPI GetCurrentHwProfile( _Out_  LPHW_PROFILE_INFO lpHwProfileInfo )
    attach_function 'GetCurrentHwProfileA', [:pointer], :bool
    attach_function 'GetCurrentHwProfileW', [:pointer], :bool

    #BOOL WINAPI GetUserName(
    #  _Out_    LPTSTR lpBuffer,
    #  _Inout_  LPDWORD lpnSize )
    attach_function 'GetUserNameA', [:pointer, :pointer], :bool
    attach_function 'GetUserNameW', [:pointer, :pointer], :bool

    ffi_lib 'secur32'

    #BOOLEAN WINAPI GetComputerObjectName(
    #  _In_     EXTENDED_NAME_FORMAT NameFormat,
    #  _Out_    LPTSTR lpNameBuffer,
    #  _Inout_  PULONG lpnSize )
    attach_function 'GetComputerObjectNameA', [ExtendedNameFormat ,:pointer, :pointer], :bool
    attach_function 'GetComputerObjectNameW', [ExtendedNameFormat ,:pointer, :pointer], :bool

    #BOOLEAN WINAPI GetUserNameEx(
    #  _In_     EXTENDED_NAME_FORMAT NameFormat,
    #  _Out_    LPTSTR lpNameBuffer,
    #  _Inout_  PULONG lpnSize )
    attach_function 'GetUserNameExA', [ExtendedNameFormat, :pointer, :pointer], :bool
    attach_function 'GetUserNameExW', [ExtendedNameFormat, :pointer, :pointer], :bool

    #BOOLEAN WINAPI TranslateName(
    #  _In_     LPCTSTR lpAccountName,
    #  _In_     EXTENDED_NAME_FORMAT AccountNameFormat,
    #  _In_     EXTENDED_NAME_FORMAT DesiredNameFormat,
    #  _Out_    LPTSTR lpTranslatedName,
    #  _Inout_  PULONG nSize )
    attach_function 'TranslateNameA', [:string, ExtendedNameFormat, ExtendedNameFormat, :string, :pointer], :bool
    attach_function 'TranslateNameW', [:string, ExtendedNameFormat, ExtendedNameFormat, :string, :pointer], :bool

    # These macros are from windef.h, but I've put them here for now
    # since they can be used in conjunction with some of the functions
    # declared in this module.

    def MAKEWORD(a, b)
      ((a & 0xff) | ((b & 0xff) << 8))
    end

    def MAKELONG(a, b)
      ((a & 0xffff) | ((b & 0xffff) << 16))
    end

    def LOWORD(l)
      l & 0xffff
    end

    def HIWORD(l)
      l >> 16
    end

    def LOBYTE(w)
      w & 0xff
    end

    def HIBYTE(w)
      w >> 8
    end

    # Returns a float indicating the major and minor version of Windows,
    # e.g. 5.1, 6.0, etc.
    #
    def windows_version
      version = GetVersion()
      major = LOBYTE(LOWORD(version))
      minor = HIBYTE(LOWORD(version))
      Float("#{major}.#{minor}")
    end

    # Custom methods that may come in handy

    # Returns true if the current platform is Vista (any variant) or Windows
    # Server 2008, i.e. major version 6, minor version 0.
    #
    def windows_2000?
      version = GetVersion()
      LOBYTE(LOWORD(version)) == 5 && HIBYTE(LOWORD(version)) == 0
    end

    # Returns true if the current platform is Windows XP or Windows XP
    # Pro, i.e. major version 5, minor version 1 (or 2 in the case of a
    # 64-bit Windows XP Pro).
    #--
    # Because of the exception for a 64-bit Windows XP Pro, we have to
    # do things the hard way. For version 2 we look for any of the suite
    # masks that might be associated with Windows 2003. If we don't find
    # any of them, assume it's Windows XP.
    #
    def windows_xp?
      bool = false

      buf = OSVERSIONINFOEX.new
      buf[:dwOSVersionInfoSize] = OSVERSIONINFOEX.size

      GetVersionExA(buf)

      major = buf[:dwMajorVersion]
      minor = buf[:dwMinorVersion]
      suite = buf[:wSuiteMask]

      # Make sure we detect a 64-bit Windows XP Pro
      if major == 5
        if minor == 1
          bool = true
        elsif minor == 2
          if (suite & VER_SUITE_BLADE == 0)          &&
              (suite & VER_SUITE_COMPUTE_SERVER == 0) &&
              (suite & VER_SUITE_DATACENTER == 0)     &&
              (suite & VER_SUITE_ENTERPRISE == 0)     &&
              (suite & VER_SUITE_STORAGE_SERVER == 0)
          then
            bool = true
          end
        else
          # Do nothing - already false
        end
      end

      bool
    end

    # Returns true if the current platform is Windows 2003 (any version).
    # i.e. major version 5, minor version 2.
    #--
    # Because of the exception for a 64-bit Windows XP Pro, we have to
    # do things the hard way. For version 2 we look for any of the suite
    # masks that might be associated with Windows 2003. If we find any
    # of them, assume it's Windows 2003.
    #
    def windows_2003?
      bool = false

      buf = OSVERSIONINFOEX.new
      buf[:dwOSVersionInfoSize] = OSVERSIONINFOEX.size

      GetVersionExA(buf)

      major = buf[:dwMajorVersion]
      minor = buf[:dwMinorVersion]
      suite = buf[:wSuiteMask]

      # Make sure we exclude a 64-bit Windows XP Pro
      if major == 5 && minor == 2
        if (suite & VER_SUITE_BLADE > 0)          ||
            (suite & VER_SUITE_COMPUTE_SERVER > 0) ||
            (suite & VER_SUITE_DATACENTER > 0)     ||
            (suite & VER_SUITE_ENTERPRISE > 0)     ||
            (suite & VER_SUITE_STORAGE_SERVER > 0)
        then
          bool = true
        end
      end

      bool
    end

    # Returns true if the current platform is Windows Vista (any variant)
    # or Windows Server 2008, i.e. major version 6, minor version 0.
    #
    def windows_vista?
      version = GetVersion()
      LOBYTE(LOWORD(version)) == 6 && HIBYTE(LOWORD(version)) == 0
    end

    def windows_7?
      version = GetVersion()
      LOBYTE(LOWORD(version)) == 6 && HIBYTE(LOWORD(version)) == 1
    end

    def windows_8?
      version = GetVersion()
      LOBYTE(LOWORD(version)) == 6 && HIBYTE(LOWORD(version)) == 2
    end

    def windows_8_1?
      version = GetVersion()
      LOBYTE(LOWORD(version)) == 6 && HIBYTE(LOWORD(version)) == 3
    end
  end
end