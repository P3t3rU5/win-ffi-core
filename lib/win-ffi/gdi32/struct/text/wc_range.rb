module WinFFI
  module Gdi32

    # https://msdn.microsoft.com/en-us/library/dd145197(v=vs.85).aspx
    class WCRANGE < FFIStruct
      layout :wcLow,   :char,
             :cGlyphs, :ushort
    end
  end
end