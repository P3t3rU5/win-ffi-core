module WinFFI
  module Gdi32
    # Definitions to be used by GetDisplayConfigBufferSizes and QueryDisplayConfig.
    QueryDisplayConfigFlag = enum :query_display_config_flag, [
        :ALL_PATHS,          0x00000001,
        :ONLY_ACTIVE_PATHS,  0x00000002,
        :DATABASE_CURRENT,   0x00000004,
        :VIRTUAL_MODE_AWARE, 0x00000010
    ]
  end
end