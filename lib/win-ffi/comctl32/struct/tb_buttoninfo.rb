module WinFFI
  module Comctl32
    class TBBUTTONINFO < FFIStruct
      layout :cbSize,    :uint,
             :dwMask,    :dword,
             :idCommand, :int,
             :iImage,    :int,
             :fsState,   :byte,
             :fsStyle,   :byte,
             :cx,        :word,
             :lParam,    :dword,
             :pszText,   :string,
             :cchText,   :int

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end