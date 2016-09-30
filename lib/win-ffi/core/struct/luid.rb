module WinFFI
  if WindowsVersion >= :xp
    # Locally Unique Identifier
    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa379261(v=vs.85).aspx
    class LUID < FFIAdditions::Struct
      layout LowPart: :dword,
             HighPart: :long
    end
  end
end