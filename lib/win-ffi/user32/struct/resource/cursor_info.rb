require 'win-ffi/general/struct/point'

module WinFFI
  module User32
    # Information about the global cursor.
    class CURSORINFO < FFIStruct
      layout :cbSize,      :dword,
             :flags,       CursorInfoFlags,
             :hCursor,     :hcursor,
             :ptScreenPos, POINT

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end