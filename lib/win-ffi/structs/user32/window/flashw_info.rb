module WinFFI
  module User32
    class FlashwInfo < FFIStruct
      layout :cbSize,    :uint,
             :hwnd,      :hwnd,
             :dwFlags,   :dword,
             :uCount,    :uint,
             :dwTimeout, :dword
    end
  end
end
