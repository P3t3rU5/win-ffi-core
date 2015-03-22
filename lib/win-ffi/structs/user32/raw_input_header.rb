module WinFFI
  module User32
    class RAWINPUTHEADER < FFIStruct
      layout :dwType,   :dword,
             :dwSize,   :dword,
             :hDevice,  :handle,
             :wParam,   :wparam
    end
  end
end