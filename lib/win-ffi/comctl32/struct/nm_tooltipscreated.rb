require 'win-ffi/comctl32/struct/nm_hdr'

module WinFFI
  module Comctl32
    class NMTOOLTIPSCREATED < FFIStruct
      layout         :hdr,          NMHDR,
                     :hwndToolTips, :hwnd
    end
  end
end
