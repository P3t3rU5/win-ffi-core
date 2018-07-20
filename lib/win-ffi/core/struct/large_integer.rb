module WinFFI
  # https://msdn.microsoft.com/en-us/library/windows/desktop/aa383713(v=vs.85).aspx
  # class LARGE_INTEGER_STRUCT < FFIAdditions::Struct
  #   layout LowPart:  :dword,
  #          HighPart: :long
  # end
  #
  # class LARGE_INTEGER < FFIAdditions::Union
  #   layout s: LARGE_INTEGER_STRUCT,
  #          u: LARGE_INTEGER_STRUCT
  # end

  class LARGE_INTEGER < FFIAdditions::Struct
    def QuadPart; end
    def QuadPart=(v) end

    layout QuadPart: :long_long
  end
end