module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd373663(v=vs.85).aspx
    class TOGGLEKEYS < FFIStruct
      layout :cbSize,  :uint,
             :dwFlags, ToggleKeysFlags

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end