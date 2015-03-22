module WinFFI
  module User32
    class LASTINPUTINFO < FFIStruct
      layout :cbSize, :uint,
             :dwTime, :dword
    end
  end
end