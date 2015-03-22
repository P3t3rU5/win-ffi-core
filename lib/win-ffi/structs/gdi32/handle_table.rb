module WinFFI
  module Gdi32
    class HANDLETABLE < FFIStruct
      layout :objectHandle, :pointer
    end
  end
end