require 'win-ffi/gdi32'

module WinFFI
  module Gdi32
    FontCharset = enum FFI::Type::UINT8, :font_charset, [
        :ANSI,          0,
        :DEFAULT,       1,
        :SYMBOL,        2,
        :MAC,          77,
        :SHIFTJIS,    128,
        :HANGEUL,     129,
        :HANGUL,      129,
        :JOHAB,       130,
        :GB2312,      134,
        :CHINESEBIG5, 136,
        :GREEK,       161,
        :TURKISH,     162,
        :VIETNAMESE,  163,
        :HEBREW,      177,
        :ARABIC,      178,
        :BALTIC,      186,
        :RUSSIAN,     204,
        :THAI,        222,
        :EASTEUROPE,  238,
        :OEM,         255
    ]
  end
end