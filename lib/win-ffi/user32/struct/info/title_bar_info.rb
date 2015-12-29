require 'win-ffi/general/struct/rect'

module WinFFI
  module User32
    class TITLEBARINFO < FFIStruct
      layout :cbSize,        :dword,
             :rcTitleBar,    RECT,
             :rgstate,       :dword

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end