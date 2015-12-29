module WinFFI
  module Comctl32
    class COLORSCHEME < FFIStruct
      layout :dwSize,          :dword,
             :clrBtnHighlight, :colorref, # highlight color,
             :clrBtnShadow,    :colorref     # shadow color

      def initialize
        self.dwSize = self.size
      end
    end
  end
end