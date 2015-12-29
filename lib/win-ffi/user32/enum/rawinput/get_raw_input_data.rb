require 'win-ffi/user32'

module WinFFI
  module User32
    # Flags for GetRawInputData
    GetRawInputDataFlags = enum :get_rawinput_data_flags, [
        :INPUT,  0x10000003,
        :HEADER, 0x10000005
    ]
  end
end