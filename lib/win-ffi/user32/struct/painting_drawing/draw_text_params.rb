module WinFFI
  module User32
    class DRAWTEXTPARAMS < FFIStruct
      layout :cbSize,        :uint,
             :iTabLength,    :int,
             :iLeftMargin,   :int,
             :iRightMargin,  :int,
             :uiLengthDrawn, :uint

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end