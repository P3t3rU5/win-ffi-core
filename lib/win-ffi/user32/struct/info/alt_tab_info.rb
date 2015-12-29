require 'win-ffi/user32'

require 'win-ffi/general/struct/point'

module WinFFI
  module User32
    # Alt-Tab Switch window information.
    class ALTTABINFO < FFIStruct
      layout :cbSize,    :dword,
             :cItems,    :int,
             :cColumns,  :int,
             :cRows,     :int,
             :iColFocus, :int,
             :iRowFocus, :int,
             :cxItem,    :int,
             :cyItem,    :int,
             :ptStart,   POINT

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end
