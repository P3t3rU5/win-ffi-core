module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648054(v=vs.85).aspx
    class ICONMETRICS < FFIStruct
      layout :cbSize, :uint,
             :iHorzSpacing, :int,
             :iVertSpacing, :int,
             :iTitleWrap, :int,
             :lfFont, :logfonta

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end
