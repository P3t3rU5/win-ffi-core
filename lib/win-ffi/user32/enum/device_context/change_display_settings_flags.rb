require 'win-ffi/user32'

module WinFFI
  module User32
    # Flags for ChangeDisplaySettings
    buffer = [
        :UPDATEREGISTRY,  0x00000001,
        :TEST,            0x00000002,
        :FULLSCREEN,      0x00000004,
        :GLOBAL,          0x00000008,
        :SET_PRIMARY,     0x00000010,
        :VIDEOPARAMETERS, 0x00000020,
        :RESET,           0x40000000,
        :RESET_EX,        0x20000000,
        :NORESET,         0x10000000,
    ]

    if WindowsVersion >= :vista
      buffer += [
          :ENABLE_UNSAFE_MODES,  0x00000100,
          :DISABLE_UNSAFE_MODES, 0x00000200
      ]
    end

    ChangeDisplaySettingsFlags = enum :change_display_settings_flags, buffer
  end
end