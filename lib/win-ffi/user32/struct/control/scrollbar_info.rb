require 'win-ffi/general/struct/rect'

module WinFFI
  module User32
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