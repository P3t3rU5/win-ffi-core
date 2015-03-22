module WinFFI
  module User32
    class TRACKMOUSEEVENT < FFIStruct
      layout :cbSize,      :dword,
             :dwFlags,     :dword,
             :hwndTrack,   :hwnd,
             :dwHoverTime, :dword
    end
  end
end