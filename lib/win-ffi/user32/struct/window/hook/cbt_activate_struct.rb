module WinFFI
  module User32
    # HCBT_ACTIVATE structure pointed to by lParam
    class CBTACTIVATESTRUCT < FFIStruct
      layout :fMouse, :bool,
             :hWndActive, :hwnd
    end
  end
end