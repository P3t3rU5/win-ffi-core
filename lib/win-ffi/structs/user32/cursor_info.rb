require 'win-ffi/structs/point'

module WinFFI
  module User32
    class CURSORINFO < FFIStruct
      layout :cbSize,      :dword,
             :flags,       :dword,
             :hCursor,     :hcursor,
             :ptScreenPos, POINT
    end
  end
end