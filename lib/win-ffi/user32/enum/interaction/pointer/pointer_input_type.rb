require 'win-ffi/user32'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/hh454908(v=vs.85).aspx
    if WindowsVersion >= 8
      buffer = [
          :POINTER, 0x00000001, # Generic pointer type. This type never appears in pointer messages or pointer data.
          # Some data query functions allow the caller to restrict the query to specific pointer type. The PT_POINTER
          # type can be used in these functions to specify that the query is to include pointers of all types
          :TOUCH,   0x00000002, # Touch pointer type.
          :PEN,     0x00000003, # Pen pointer type.
          :MOUSE,   0x00000004  # Mouse pointer type.
      ]

      if WindowsVersion >= 8.1
        buffer += [
            :TOUCHPAD, 0x00000005  #Touchpad pointer type
        ]
      end
      POINTER_INPUT_TYPE = enum :pointer_input_type, buffer
    end
  end
end