require 'win-ffi/user32'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/hh969217(v=vs.85).aspx
    TouchMask = enum :touch_mask, [
      :NONE,        0x00000000, #Default. None of the optional fields are valid.
      :CONTACTAREA, 0x00000001, #rcContact of the POINTER_TOUCH_INFO structure is valid.
      :ORIENTATION, 0x00000002, #orientation of the POINTER_TOUCH_INFO structure is valid.
      :PRESSURE,    0x00000004, #pressure of the POINTER_TOUCH_INFO structure is valid.
    ]
  end
end