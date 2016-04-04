module WinFFI
  module Gdi32
    class DISPLAYCONFIG_2DREGION < FFIStruct
      layout :cx, :uint32,
             :cy, :uint32
    end
  end
end