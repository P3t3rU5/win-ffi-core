module WinFFI
  module User32
    # Message structure used by WH_CALLWNDPROCRET
    class CWPRETSTRUCT < FFIStruct
      layout :lResult, :lresult,
             :lParam,  :lparam,
             :wParam,  :wparam,
             :message, :uint,
             :hwnd,    :hwnd
    end
  end
end