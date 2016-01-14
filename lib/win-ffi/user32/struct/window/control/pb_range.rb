module WinFFI
  module User32
    class PBRANGE < FFIStruct
      layout :iLow,      :int,
             :iHigh,      :int
    end
  end
end