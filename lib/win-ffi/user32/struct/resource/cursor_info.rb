require 'win-ffi/general/struct/point'

require 'win-ffi/user32/enum/resource/cursor/cursor_info_flags'

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