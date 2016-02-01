module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632607(v=vs.85).aspx
    class STYLESTRUCT < FFIStruct
      layout :styleOld, :dword,
             :styleNew, :dword
    end
  end
end