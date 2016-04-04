require 'win-ffi/gdi32/struct/text/wc_range'

module WinFFI
  module Gdi32

    # https://msdn.microsoft.com/en-us/library/dd144956(v=vs.85).aspx
    class GLYPHSET < FFIStruct
      layout :cbThis,           :dword,
             :flAccel,          :dword,
             :cGlyphsSupported, :dword,
             :cRanges,          :dword,
             :ranges,           [WCRANGE, 1]
    end
  end
end