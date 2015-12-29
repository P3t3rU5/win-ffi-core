module WinFFI
  module User32
    class ICONINFO < FFIStruct
      layout :fIcon,    :bool,
             :xHotspot, :dword,
             :yHotspot, :dword,
             :hbmMask,  :pointer,
             :hbmColor, :pointer
    end
  end
end