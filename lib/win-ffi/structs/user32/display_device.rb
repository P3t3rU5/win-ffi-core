module WinFFI
  module User32
    class DISPLAY_DEVICE < FFIStruct
      layout :cb,           :dword,
             :DeviceName,   [:char, 32],
             :DeviceString, [:char, 128],
             :StateFlags,   :dword,
             :DeviceID,     [:char, 128],
             :DeviceKey,    [:char, 128]
    end
  end
end