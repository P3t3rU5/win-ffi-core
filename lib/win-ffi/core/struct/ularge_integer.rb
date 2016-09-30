require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # class ULARGE_INTEGER_UNION < FFIAdditions::Struct
    #   layout LowPart:  :dword,
    #          HighPart: :dword
    # end
    #
    # class ULARGE_INTEGER < FFIAdditions::Union
    #   layout s: ULARGE_INTEGER_UNION,
    #          u: ULARGE_INTEGER_UNION
    # end

    class ULARGE_INTEGER < FFIAdditions::Struct
      layout QuadPart: :ulong_long
    end
  end
end