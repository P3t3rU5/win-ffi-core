require 'win-ffi/user32'

module WinFFI
  module User32
    # Flags for EnumDisplaySettingsEx
    EnumDisplaySettingsExFlags = enum :enum_display_settings_ex_flags, [
        :RAWMODE,     0x00000002,
        :ROTATEDMODE, 0x00000004,
    ]
  end
end