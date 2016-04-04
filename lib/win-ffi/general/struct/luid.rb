module WinFFI
  if WindowsVersion >= :xp
    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa379261(v=vs.85).aspx
    class LUID < FFIStruct
      layout :LowPart,  :dword,
             :HighPart, :long
    end
  end
end