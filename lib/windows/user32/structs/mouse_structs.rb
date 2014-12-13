module WinFFI
  module User32
    module Mouse
      class MOUSEMOVEPOINT < FFI::Struct
        layout :x,           :int,
               :y,           :int,
               :time,        :dword,
               :dwExtraInfo, :ulong
      end


      class TRACKMOUSEEVENT < FFI::Struct
        layout :cbSize,      :dword,
               :dwFlags,     :dword,
               :hwndTrack,   :hwnd,
               :dwHoverTime, :dword
      end
    end
  end
end