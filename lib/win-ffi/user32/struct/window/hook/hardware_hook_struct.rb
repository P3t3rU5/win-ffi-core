module WinFFI
  module User32
    # Structure used by WH_HARDWARE
    class HARDWAREHOOKSTRUCT < FFIStruct
      layout :hwnd,    :hwnd,
             :message, :uint,
             :wParam,  :wparam,
             :lParam,  :lparam
    end
  end
end