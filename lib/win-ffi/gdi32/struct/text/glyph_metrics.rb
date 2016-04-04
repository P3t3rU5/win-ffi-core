module WinFFI
  module Gdi32
    # https://msdn.microsoft.com/en-us/library/dd144955(v=vs.85).aspx
    class GLYPHMETRICS < FFIStruct
      layout :gmBlackBoxX,     :uint,
             :gmBlackBoxY,     :uint,
             :gmptGlyphOrigin, POINT,
             :gmCellIncX,     :short,
             :gmCellIncY,     :short
    end
  end
end