module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648052(v=vs.85).aspx
    class ICONINFO < FFIStruct
      layout :fIcon,    :bool,
             :xHotspot, :dword,
             :yHotspot, :dword,
             :hbmMask,  :pointer,
             :hbmColor, :pointer
    end
  end
end