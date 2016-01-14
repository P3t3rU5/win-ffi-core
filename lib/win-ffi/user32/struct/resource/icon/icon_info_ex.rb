module WinFFI
  module User32
    if WindowsVersion >= :vista
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648053(v=vs.85).aspx
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