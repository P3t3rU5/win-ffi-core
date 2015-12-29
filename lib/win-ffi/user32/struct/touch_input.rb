module WinFFI
  module User32
    class TOUCHINPUT < FFIStruct
      layout :x,           :long,
             :y,           :long,
             :hSource,     :handle,
             :dwID,        :dword,
             :dwFlags,     TouchEventFlags,
             :dwMask,      :dword,
             :dwTime,      :dword,
             :dwExtraInfo, :ulong,
             :cxContact,   :dword,
             :cyContact,   :dword
    end
  end
end