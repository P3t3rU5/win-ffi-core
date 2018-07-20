module WinFFI
  if WINDOWS_VERSION >= :xp
    # Locally Unique Identifier
    # https://docs.microsoft.com/en-us/windows/desktop/api/winnt/ns-winnt-_luid
    class LUID < FFIAdditions::Struct
      def LowPart; end
      def LowPart=(v) end
      def HighPart; end
      def HighPart=(v) end

      layout LowPart:  :dword,
             HighPart: :long
    end
  end
end