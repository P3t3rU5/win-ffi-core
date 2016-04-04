module WinFFI
  module Gdi32
    # Definitions used by SetDisplayConfig.
    SetDisplayConfigFlag = enum :set_display_config_flag, [
        :TOPOLOGY_INTERNAL,            0x00000001,
        :TOPOLOGY_CLONE,               0x00000002,
        :TOPOLOGY_EXTEND,              0x00000004,
        :TOPOLOGY_EXTERNAL,            0x00000008,
        :USE_DATABASE_CURRENT,         0x0000000F,
        :TOPOLOGY_SUPPLIED,            0x00000010,
        :USE_SUPPLIED_DISPLAY_CONFIG,  0x00000020,
        :VALIDATE,                     0x00000040,
        :APPLY,                        0x00000080,
        :NO_OPTIMIZATION,              0x00000100,
        :SAVE_TO_DATABASE,             0x00000200,
        :ALLOW_CHANGES,                0x00000400,
        :PATH_PERSIST_IF_REQUIRED,     0x00000800,
        :FORCE_MODE_ENUMERATION,       0x00001000,
        :ALLOW_PATH_ORDER_CHANGES,     0x00002000,
        :VIRTUAL_MODE_AWARE,           0x00008000
    ]
  end
end