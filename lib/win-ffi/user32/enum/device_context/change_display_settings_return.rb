require 'win-ffi/user32'

module WinFFI
  module User32
    # Return values for ChangeDisplaySettings
    buffer = [
        :CHANGE_SUCCESSFUL,  0,
        :CHANGE_RESTART,     1,
        :CHANGE_FAILED,     -1,
        :CHANGE_BADMODE,    -2,
        :CHANGE_NOTUPDATED, -3,
        :CHANGE_BADFLAGS,   -4,
        :CHANGE_BADPARAM,   -5,
    ]

    if WindowsVersion >= :xp
      buffer += [
          :CHANGE_BADDUALVIEW, -6
      ]
    end

    ChangeDisplaySettingsReturn = enum :change_display_settings_return, buffer
  end
end