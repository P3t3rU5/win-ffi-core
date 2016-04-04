module WinFFI
  module User32

    MONITORINFOF_PRIMARY =0x00000001

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145065(v=vs.85).aspx
    class MONITORINFO < FFIStruct
      layout :cbSize,    :dword,
             :rcMonitor, RECT,
             :rcWork,    RECT,
             :dwFlags,   :dword
    end
  end
end