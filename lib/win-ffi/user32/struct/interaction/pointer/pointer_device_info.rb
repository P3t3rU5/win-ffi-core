require 'win-ffi/user32/function/multiple_display_monitors'

module WinFFI
  module User32
    if WindowsVersion >= 8

      require 'win-ffi/user32/struct/interaction/pointer/pointer_device_info'

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh802891(v=vs.85).aspx
      POINTER_DEVICE_PRODUCT_STRING_MAX = 520

      class POINTER_DEVICE_INFO < FFIStruct
        layout :displayOrientation, :dword,
               :device,             :handle,
               :pointerDeviceType,  POINTER_DEVICE_TYPE,
               :monitor,            :hmonitor,
               :startingCursorId,   :ulong,
               :maxActiveContacts,  :ushort,
               :productString,      [:char, POINTER_DEVICE_PRODUCT_STRING_MAX]
      end
    end
  end
end