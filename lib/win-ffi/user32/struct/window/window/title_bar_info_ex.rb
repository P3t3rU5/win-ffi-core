module WinFFI
  module User32
    if WindowsVersion >= :vista
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa969233(v=vs.85).aspx
      class TITLEBARINFOEX < FFIStruct
        layout :cbSize,     :dword,
               :rcTitleBar, RECT,
               :rgstate,    [:dword, 6],
               :rgrect,     [RECT, 6]

        def initialize
          super
          self.cbSize = self.size
        end
      end
    end
  end
end
