module WinFFI
  module User32
    # Structure used by WH_MOUSE
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644968(v=vs.85).aspx
    class MOUSEHOOKSTRUCT < FFIStruct
      layout :pt,           POINT,
             :hwnd,         :hwnd,
             :wHitTestCode, :uint,
             :dwExtraInfo,  :ulong
    end
  end
end