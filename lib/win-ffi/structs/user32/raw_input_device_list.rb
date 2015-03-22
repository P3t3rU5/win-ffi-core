require_relative '../../enums/user32/rim'

module WinFFI
  module User32
    class RAWINPUTDEVICELIST < FFIStruct
      layout :hDevice, :handle,
             :dwType,  RIM
    end
  end
end