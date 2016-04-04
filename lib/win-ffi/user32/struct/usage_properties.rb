module WinFFI
  module User32
    # TODO figure out what this represents
    class USAGE_PROPERTIES < FFIStruct
      layout :level,           :ushort,
             :page,            :ushort,
             :usage,           :ushort,
             :logicalMinimum,  :int32,
             :logicalMaximum,  :int32,
             :unit,            :ushort,
             :exponent,        :ushort,
             :count,           :byte,
             :physicalMinimum, :int32,
             :physicalMaximum, :int32
    end
  end
end