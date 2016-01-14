module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318112(v=vs.85).aspx
    class HIGHCONTRAST < FFIStruct
      layout :cbSize,              :uint,
             :dwFlags, HighContrastFlags,
             :lpszDefaultScheme, :string

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end
