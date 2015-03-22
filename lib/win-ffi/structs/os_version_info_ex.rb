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

    def get!
      tap do |ovi|
        ovi[:dwOSVersionInfoSize] = size
        Kernel32::GetVersionExA(ovi)
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