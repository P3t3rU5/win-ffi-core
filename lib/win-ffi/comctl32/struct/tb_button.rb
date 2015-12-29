module WinFFI
  module Comctl32
    class TBBUTTON < FFIStruct
      layout :iBitmap,   :int,
             :idCommand, :int,
             :fsState,   :byte,
             :fsStyle,   :byte,
             :bReserved, [:byte, Architecture == 32 ? 2 : # padding for alignment, windows 32
             6], # padding for alignment, windows 64
             :dwData,    :dword,
             :iString,   :int
    end
  end
end