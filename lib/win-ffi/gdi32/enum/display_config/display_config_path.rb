module WinFFI
  module Gdi32
    # Flags for path info structure (from OS to application through QDC)
    DisplayConfigPath = enum :display_config_path, [
        :ACTIVE,               0x00000001,
        :PREFERRED_UNSCALED,   0x00000004,
        :SUPPORT_VIRTUAL_MODE, 0x00000008,
        :VALID_FLAGS,          0x0000000D
    ]
  end
end