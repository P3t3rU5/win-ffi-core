require_relative '../../../core/wide_inline_string'

require_relative '../../enum/system_info/win32_winnt'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/desktop/api/winnt/ns-winnt-_osversioninfoexa
    # https://docs.microsoft.com/en-us/windows/desktop/api/winnt/ns-winnt-_osversioninfoexw
    class OSVERSIONINFOEX < FFIAdditions::Struct

      include Comparable

      def dwOSVersionInfoSize; end
      def dwOSVersionInfoSize=(v) end
      def dwMajorVersion; end
      def dwMajorVersion=(v) end
      def dwMinorVersion; end
      def dwMinorVersion=(v) end
      def dwBuildNumber; end
      def dwBuildNumber=(v) end
      def dwPlatformId; end
      def dwPlatformId=(v) end
      def szCSDVersion; end
      def szCSDVersion=(v) end
      def wServicePackMajor; end
      def wServicePackMajor=(v) end
      def wServicePackMinor; end
      def wServicePackMinor=(v) end
      def wSuiteMask; end
      def wSuiteMask=(v) end
      def wProductType; end
      def wProductType=(v) end
      def wReserved; end
      def wReserved=(v) end

      layout dwOSVersionInfoSize: :ulong,
             dwMajorVersion:      :ulong,
             dwMinorVersion:      :ulong,
             dwBuildNumber:       :ulong,
             dwPlatformId:        :ulong,
             szCSDVersion:        WideInlineString.new(128),
             wServicePackMajor:   :ushort,
             wServicePackMinor:   :ushort,
             wSuiteMask:          :ushort,
             wProductType:        :uchar,
             wReserved:           :uchar

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

      def minor=(minor)
        self.dwMinorVersion = minor
      end

      def build=(build)
        self.dwBuildNumber = build
      end

      def hex
        (major << 8) + minor
      end

      def <=>(version)
        hex <=> WindowsVersions[case version
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
          when WIN32_WINNT_WIN2K...WIN32_WINNT_WINXP   then 'Windows 2000'
          when WIN32_WINNT_WINXP...WIN32_WINNT_VISTA   then 'Windows XP'
          when WIN32_WINNT_VISTA...WIN32_WINNT_WIN7    then 'Windows Vista'
          when WIN32_WINNT_WIN7...WIN32_WINNT_WIN8     then 'Windows 7'
          when WIN32_WINNT_WIN8...WIN32_WINNT_WINBLUE  then 'Windows 8'
          when WIN32_WINNT_WINBLUE...WIN32_WINNT_WIN10 then 'Windows 8.1'
          when WIN32_WINNT_WIN10                       then 'Windows 10'
          else                                              'Unknown'
        end
      end

      def to_s; "#{name} v#{major}.#{minor}.#{build} SP#{sp}" end
    end
  end
end