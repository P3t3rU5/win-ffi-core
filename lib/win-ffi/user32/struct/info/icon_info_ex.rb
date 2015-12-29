module WinFFI
  module User32
    if WindowsVersion >= :vista
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

        def initialize
          super
          self.cbSize = self.size
        end
      end
    end
  end
end