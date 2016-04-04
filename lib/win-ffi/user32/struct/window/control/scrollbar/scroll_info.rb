require 'win-ffi/user32/enum/window/flag/scroll_info_flag'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/bb787537(v=vs.85).aspx
    class SCROLLINFO < FFIStruct
      layout :cbSize,    :uint,
             :fMask,     ScrollInfoFlag,
             :nMin,      :int,
             :nMax,      :int,
             :nPage,     :uint,
             :nPos,      :int,
             :nTrackPos, :int

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end