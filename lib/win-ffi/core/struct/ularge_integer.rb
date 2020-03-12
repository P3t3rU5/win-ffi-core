module WinFFI
  class ULARGE_INTEGER_UNION < FFIAdditions::Struct
    attr_accessor :LowPart, :HighPart
    layout LowPart:  :dword,
           HighPart: :dword
  end

  # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-ularge_integer~r1
  class ULARGE_INTEGER < FFIAdditions::Union
    attr_accessor :s, :u, :QuadPart
    layout s: ULARGE_INTEGER_UNION,
           u: ULARGE_INTEGER_UNION,
           QuadPart: :ulong_long
  end
end