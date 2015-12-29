require 'win-ffi/comctl32/struct/nm_hdr'

module WinFFI
  module Comctl32
    class NMCUSTOMSPLITRECTINFO < FFIStruct
      layout :hdr,      NMHDR,
             :rcClient, RECT,
             :rcButton, RECT,
             :rcSplit,  RECT
    end
  end
end