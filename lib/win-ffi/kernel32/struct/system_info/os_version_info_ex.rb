require_relative '../../../core/wide_inline_string'

require_relative '../../enum/system_info/win32_winnt'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-osversioninfoexa
    # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-osversioninfoex2
    class OSVERSIONINFOEX < FFIAdditions::Struct

      include Comparable

      attr_accessor :dwOSVersionInfoSize,
                    :dwMajorVersion,
                    :dwMinorVersion,
                    :dwBuildNumber,
                    :dwPlatformId,
                    :szCSDVersion,
                    :wServicePackMajor,
                    :wServicePackMinor,
                    :wSuiteMask,
                    :wProductType,
                    :wReserved

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
        get!
      end

      def get!
        Kernel32.GetVersionEx(self)
        self
      end

      alias_method :major,  :dwMajorVersion
      alias_method :major=, :dwMajorVersion=
      alias_method :minor,  :dwMinorVersion
      alias_method :minor=, :dwMinorVersion=
      alias_method :build,  :dwBuildNumber
      alias_method :build=, :dwBuildNumber=
      alias_method :sp,     :wServicePackMajor
      alias_method :sp=,    :wServicePackMajor=

      def hex
        (major << 8) + minor
      end

      def <=>(version)
        hex <=> WindowsVersion[case version
                                  when '2000', 2000                           then :WIN2K
                                  when 'xp', :xp                              then :WINXP
                                  when 'server2003', :server2003, 2003        then :WS03
                                  when 'vista', :vista, 'longhorn', :longhorn then :VISTA
                                  when '7', 7                                 then :WIN7
                                  when '8', 8                                 then :WIN8
                                  when '8.1', 8.1, 'blue', :blue              then :WINBLUE
                                  when '10', 10, 'thresold', :thresold        then :WIN10
                                  when Integer                                then version
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
