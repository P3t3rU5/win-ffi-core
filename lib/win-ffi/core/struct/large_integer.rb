module WinFFI
  class LARGE_INTEGER_STRUCT < FFIAdditions::Struct
    attr_accessor :LowPart, :HighPart
    layout LowPart:  :dword,
           HighPart: :long
  end

  # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-large_integer~r1
  class LARGE_INTEGER < FFIAdditions::Union
    attr_accessor :s, :u, :QuadPart

    layout s: LARGE_INTEGER_STRUCT,
           u: LARGE_INTEGER_STRUCT,
           QuadPart: :long_long
  end
end