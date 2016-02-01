module WinFFI
  # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373931(v=vs.85).aspx
  class GUID < FFIStruct
    layout :Data1, :dword,
           :Data2, :word,
           :Data3, :word,
           :Data4, [:byte, 8]
  end
end