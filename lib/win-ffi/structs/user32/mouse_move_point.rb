module WinFFI
  module User32
    class MOUSEMOVEPOINT < FFIStruct
      layout :x,           :int,
             :y,           :int,
             :time,        :dword,
             :dwExtraInfo, :ulong
    end
  end
end