module WinFFI
  module User32
    class LUID < FFIStruct
      layout :LowPart,  :dword,
             :HighPart, :long
    end
  end
end