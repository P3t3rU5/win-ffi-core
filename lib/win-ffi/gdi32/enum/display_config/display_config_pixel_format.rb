module WinFFI
  module Gdi32
    DisplayConfigPixelFormat = enum :display_config_pixel_format, [
        :'8BPP',       1,
        :'16BPP',      2,
        :'24BPP',      3,
        :'32BPP',      4,
        :NONGDI,       5,
        :FORCE_UINT32, 0xffffffff
    ]
  end
end