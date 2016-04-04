require 'win-ffi/gdi32'

module WinFFI
  module Gdi32
    FontWeight = enum :font_weight, [
        :DONTCARE,   0,
        :THIN,       100,
        :EXTRALIGHT, 200,
        :LIGHT,      300,
        :NORMAL,     400,
        :MEDIUM,     500,
        :SEMIBOLD,   600,
        :BOLD,       700,
        :EXTRABOLD,  800,
        :HEAVY,      900,

        :ULTRALIGHT, 200,
        :REGULAR,    400,
        :DEMIBOLD,   600,
        :ULTRABOLD,  800,
        :BLACK,      900
    ]
  end
end

