require 'win-ffi/general/struct/rect'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/bb787535(v=vs.85).aspx
    # Scrollbar information
    class SCROLLBARINFO < FFIStruct
      layout :cbSize,        :dword,
             :rcScrollBar,   RECT,
             :dxyLineButton, :int,
             :xyThumbTop,    :int,
             :xyThumbBottom, :int,
             :reserved,      :int,
             :rgstate,       :dword

      def initialize
        self.cbSize = self.size
        super
      end
    end
  end
end