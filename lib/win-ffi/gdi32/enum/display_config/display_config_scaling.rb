module WinFFI
  module Gdi32
    DisplayConfigScaling = enum :display_config_scaling, [
        :IDENTITY,                1,
        :CENTERED,                2,
        :STRETCHED,               3,
        :ASPECTRATIOCENTEREDMAX,  4,
        :CUSTOM,                  5,
        :PREFERRED,               128,
        :FORCE_UINT32,            0xFFFFFFFF
    ]
  end
end