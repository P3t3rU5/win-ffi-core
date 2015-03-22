module WinFFI
  module User32
    class ICONINFOEX < FFIStruct
      layout :cbSize,    :dword,
             :fIcon,     :bool,
             :xHotspot,  :dword,
             :yHotspot,  :dword,
             :hbmMask,   :pointer,
             :hbmColor,  :pointer,
             :wResID,    :word,
             :szModName, :string,
             :szResName, :string
    end
  end
end