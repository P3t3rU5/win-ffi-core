module WinFFI
  module User32
    # Structure used by WH_DEBUG
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644965(v=vs.85).aspx
    class DEBUGHOOKINFO < FFIStruct
      layout :idThread,          :dword,
             :idThreadInstaller, :dword,
             :lParam,            :lparam,
             :wParam,            :wparam,
             :code,              :int
    end
  end
end