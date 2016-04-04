require 'win-ffi/user32'

module WinFFI
  module User32
    # Return values for ChangeDisplaySettings
    buffer = [
        :SUCCESSFUL,  0,
        :RESTART,     1,
        :FAILED,     -1,
        :BADMODE,    -2,
        :NOTUPDATED, -3,
        :BADFLAGS,   -4,
        :BADPARAM,   -5,
    ]

    if WindowsVersion >= :xp
      buffer += [
          :BADDUALVIEW, -6
      ]
    end

    ChangeDisplaySettingsReturn = enum :change_display_settings_return, buffer
  end
end