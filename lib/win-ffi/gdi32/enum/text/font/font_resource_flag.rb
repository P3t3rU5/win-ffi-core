require 'win-ffi/gdi32'

module WinFFI
  module Gdi32
    FontResourceFlag = enum :font_resource_flag, [
        :PRIVATE,  0x10,
        :NOT_ENUM, 0x20,
    ]
  end
end