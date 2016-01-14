require 'win-ffi/user32/enum/interaction/input_message_device_type'
require 'win-ffi/user32/enum/interaction/input_message_origin_id'

module WinFFI
  module User32
    if WindowsVersion >= 8
      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448799(v=vs.85).aspx
      # Input source structure.
      class INPUT_MESSAGE_SOURCE < FFIStruct
        layout :deviceType, INPUT_MESSAGE_DEVICE_TYPE,
               :originId,   INPUT_MESSAGE_ORIGIN_ID
      end
    end
  end
end