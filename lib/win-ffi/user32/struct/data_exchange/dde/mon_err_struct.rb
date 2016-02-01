module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648735(v=vs.85).aspx
    class MONERRSTRUCT < FFIStruct
      layout :cb,         :uint,
             :wLastError, :uint,
             :dwTime,     :dword,
             :hTask,      :handle
    end
  end
end