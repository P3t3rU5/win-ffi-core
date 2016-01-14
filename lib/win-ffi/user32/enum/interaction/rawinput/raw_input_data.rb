require 'win-ffi/user32'

module WinFFI
  module User32
    # Flags for GetRawInputData
    RawInputData = enum :rawinput_data, [
        :INPUT,  0x10000003, # Get the header information from the RAWINPUT structure.
        :HEADER, 0x10000005  # Get the raw data from the RAWINPUT structure.
    ]
  end
end