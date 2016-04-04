require 'win-ffi/wide_inline_string'

require 'win-ffi/kernel32/enum/version/win32_winnt'

module WinFFI
  class OSVERSIONINFOEX < FFIStruct

    include Kernel32, Comparable

    layout :dwOSVersionInfoSize, :ulong,
           :dwMajorVersion,      :ulong,
           :dwMinorVersion,      :ulong,
           :dwBuildNumber,       :ulong,
           :dwPlatformId,        :ulong,
           :szCSDVersion,        WideInlineString.new(128),
           :wServicePackMajor,   :ushort,
           :wServicePackMinor,   :ushort,
           :wSuiteMask,          :ushort,
           :wProductType,        :uchar,
           :wReserved,           :uchar

    def initialize
      super
      self[:dwOSVersionInfoSize] = size
    end

    def get!
      Kernel32.GetVersionEx(self)
      self
    end

    def major; dwMajorVersion end
    def minor; dwMinorVersion end
    def build; dwBuildNumber  end
    def sp; wServicePackMajor end

    def major=(major)
      self.dwMajorVersion = major
    end

    def minor=(minor); self.dwMinorVersion = minor end

    def build=(build); self.dwBuildNumber = build end

    def hex; (major << 8) + minor end

    def <=>(version)
      hex <=> WIN32_WINNT[case version
        when '2000',  2000                          then :WIN2K
        when 'xp',    :xp                           then :WINXP
        when 'server2003', :server2003, 2003        then :WS03
        when 'vista', :vista, 'longhorn', :longhorn then :VISTA
        when '7',     7                             then :WIN7
        when '8',     8                             then :WIN8
        when '8.1',   8.1,    'blue',     :blue     then :WINBLUE
        when '10',    10,     'thresold', :thresold then :WIN10
        when Integer         then version
        else raise ArgumentError, 'Unknown Version'
      end]
    end

    def name
      case hex
        when   WIN32_WINNT[:WIN2K]...WIN32_WINNT[:WINXP]   then 'Windows 2000'
        when   WIN32_WINNT[:WINXP]...WIN32_WINNT[:VISTA]   then 'Windows XP'
        when   WIN32_WINNT[:VISTA]...WIN32_WINNT[:WIN7]    then 'Windows Vista'
        when    WIN32_WINNT[:WIN7]...WIN32_WINNT[:WIN8]    then 'Windows 7'
        when    WIN32_WINNT[:WIN8]...WIN32_WINNT[:WINBLUE] then 'Windows 8'
        when WIN32_WINNT[:WINBLUE]...WIN32_WINNT[:WIN10]   then 'Windows 8.1'
        when   WIN32_WINNT[:WIN10]                         then 'Windows 10'
        else                                                    'Unknown'
      end
    end

    def to_s; "#{name} v#{major}.#{minor}.#{build} SP#{sp}" end
  end
end