module WinFFI
  if WINDOWS_VERSION >= :xp
    # Locally Unique Identifier
    # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-luid
    class LUID < FFIAdditions::Struct
      attr_accessor :LowPart, :HighPart

      layout LowPart:  :dword,
             HighPart: :long
    end
  end
end