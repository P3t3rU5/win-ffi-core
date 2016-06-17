require 'win-ffi/core/struct'

module WinFFI
  # https://msdn.microsoft.com/en-us/library/windows/desktop/aa383713(v=vs.85).aspx
  class LARGE_INTEGER_32 < FFIStruct
    layout :LowPart,  :dword,
           :HighPart, :long
  end

  class LARGE_INTEGER < FFI::Union
    layout :u,        LARGE_INTEGER_32,
           :QuadPart, :long_long
  end
end