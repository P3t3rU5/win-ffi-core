require 'win-ffi/user32'

module WinFFI
  module User32
    buffer = [
        :REMOVE,       0x00000001,
        :EXCLUDE,      0x00000010,
        :PAGEONLY,     0x00000020,
        :NOLEGACY,     0x00000030,
        :INPUTSINK,    0x00000100,
        :CAPTUREMOUSE, 0x00000200,  # effective when mouse nolegacy is specified, otherwise it would be an error
        :NOHOTKEYS,    0x00000200,  # effective for keyboard.
        :APPKEYS,      0x00000400,  # effective for keyboard.
        :EXMODEMASK,   0x000000F0
    ]
    buffer += [
        :EXINPUTSINK,       0x00001000,
        :DEVNOTIFY,         0x00002000
    ]

    RawInputDeviceFlag = enum :rawinput_device_flag, buffer

    def EXMODE(mode)
      mode & RawInputDeviceFlags[:EXMODEMASK]
    end
  end
end