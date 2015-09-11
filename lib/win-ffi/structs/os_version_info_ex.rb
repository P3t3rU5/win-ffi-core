module WinFFI
  class OSVERSIONINFOEX < FFIStruct
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

    def initialize
      super
      self[:dwOSVersionInfoSize] = size
    end

    def get!
      Kernel32.GetVersionExA(self)
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

    def hex; (major << 8) + minor end

    def <=>(version)
      hex <=> case version
              when '2000',  2000   then 0x0500
              when 'xp',    :xp    then 0x0501
              when 'vista', :vista then 0x0600
              when '7', 7;         then 0x0601
              when '8', 8;         then 0x0602
              when '8.1', 8.1;     then 0x0603
              when '10', 10;       then 0x0604
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
      when 0x0a00; 'Windows 10'
      else 'Unknown'
      end
    end

    def to_s; "#{name} v#{major}.#{minor}.#{build} SP#{sp}" end
  end
end