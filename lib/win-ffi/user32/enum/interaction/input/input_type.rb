require 'win-ffi/user32'

module WinFFI
  module User32
    InputType = enum :input_type, [
        :MOUSE,     0, # The event is a mouse event. Use the mi structure of the union.
        :KEYBOARD,  1, # The event is a keyboard event. Use the ki structure of the union.
        :HARDWARE,  2  # The event is a hardware event. Use the hi structure of the union.
    ]
  end
end
