require 'win-ffi/user32'

module WinFFI
  module User32
    PointerInputType = enum :pointer_input_type,
    [
      :PT_POINTER, 0x00000001,
      :PT_TOUCH,   0x00000002,
      :PT_PEN,     0x00000003,
      :PT_MOUSE,   0x00000004
    ]
  end
end