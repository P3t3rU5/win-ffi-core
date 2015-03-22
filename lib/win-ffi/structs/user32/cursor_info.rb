module WinFFI
  module User32
    class CURSORINFO < FFIStruct
      layout :cbSize,      :dword,
             :flags,       :dword,
             :hCursor,     :hcursor,
             :ptScreenPos, WinFFI::POINT
    end
  end
end