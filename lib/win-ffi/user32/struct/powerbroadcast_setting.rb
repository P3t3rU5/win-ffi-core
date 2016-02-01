require 'win-ffi/general/struct/guid'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa372723(v=vs.85).aspx
    class POWERBROADCAST_SETTING < FFIStruct
      layout :PowerSetting, GUID,
             :DataLength,   :dword,
             :Data,         [:uchar, 1]
    end
  end
end
