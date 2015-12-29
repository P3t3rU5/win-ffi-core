require 'win-ffi/general/struct/rect'

module WinFFI
  module User32
    class TPMPARAMS  < FFIStruct
      layout :cbSize,    :uint,
             :rcExclude, RECT

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end