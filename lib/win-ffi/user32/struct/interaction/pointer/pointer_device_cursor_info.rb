
module WinFFI
  module User32
    if WindowsVersion >= 8

      require 'win-ffi/user32/enum/interaction/pointer/pointer_device_cursor_type'

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh802889(v=vs.85).aspx
      class POINTER_DEVICE_CURSOR_INFO < FFIStruct
        layout :cursorId, :uint32,
               :cursor,   POINTER_DEVICE_CURSOR_TYPE
      end
    end
  end
end