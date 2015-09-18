module WinFFI
  module User32
    class FLASHWINFO < FFIStruct
      layout :cbSize,    :uint,
             :hwnd,      :hwnd,
             :dwFlags,   :dword,
             :uCount,    :uint,
             :dwTimeout, :dword
    end
  end
end
