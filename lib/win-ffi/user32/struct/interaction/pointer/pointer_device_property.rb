module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/hh802892(v=vs.85).aspx
    class POINTER_DEVICE_PROPERTY < FFIStruct
      layout :logicalMin,   :int32,
             :logicalMax,   :int32,
             :physicalMin,  :int32,
             :physicalMax,  :int32,
             :unit,         :uint32,
             :unitExponent, :uint32,
             :usagePageId,  :ushort,
             :usageId,      :ushort
    end
  end
end