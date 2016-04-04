module WinFFI
  module Gdi32
    DisplayConfigModeInfoType = enum :display_config_mode_info_type, [
        :SOURCE,        1,
        :TARGET,        2,
        :DESKTOP_IMAGE, 3,
        :FORCE_UINT32,  0xFFFFFFFF
    ]
  end
end