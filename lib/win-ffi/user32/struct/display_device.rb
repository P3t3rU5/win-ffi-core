require 'win-ffi/user32/enum/display_device_flags'

module WinFFI
  module User32
    class DISPLAY_DEVICE < FFIStruct
      layout :cb,           :dword,
             :DeviceName,   [:char, 32],
             :DeviceString, [:char, 128],
             :StateFlags,   DisplayDeviceFlags,
             :DeviceID,     [:char, 128],
             :DeviceKey,    [:char, 128]

      def initialize
        super
        self.cb = self.size
      end
    end
  end
end