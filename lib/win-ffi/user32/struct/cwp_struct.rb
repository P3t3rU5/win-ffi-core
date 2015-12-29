module WinFFI
  module User32
    # Message structure used by WH_CALLWNDPROC
    class CWPSTRUCT < FFIStruct
      layout :lParam,  :lparam,
             :wParam,  :wparam,
             :message, :uint,
             :hwnd,    :hwnd
    end
  end
end
