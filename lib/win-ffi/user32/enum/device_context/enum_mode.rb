require 'win-ffi/user32'

module WinFFI
  module User32
    EnumMode = enum :enum_mode, [
        :CURRENT_SETTINGS,  -1,
        :REGISTRY_SETTINGS, -2,
    ]
  end
end