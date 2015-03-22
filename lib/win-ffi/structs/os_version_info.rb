module WinFFI
  class OSVERSIONINFO < FFIStruct
    layout :dwOSVersionInfoSize, :ulong,
           :dwMajorVersion,      :ulong,
           :dwMinorVersion,      :ulong,
           :dwBuildNumber,       :ulong,
           :dwPlatformId,        :ulong,
           :szCSDVersion,        [:char, 128]
  end
end