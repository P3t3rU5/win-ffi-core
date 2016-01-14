require 'win-ffi/user32'

module WinFFI
  module User32
    # Raw Input Device Information
    RawInputDeviceInformation = enum :raw_input_device_information, [
        :PREPARSEDDATA,      0x20000005,
        :DEVICENAME,         0x20000007,  # the return valus is the character length, not the byte size
        :DEVICEINFO,         0x2000000b
    ]
  end
end