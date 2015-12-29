require 'win-ffi/comctl32/struct/nm_hdr'

module WinFFI
  module Comctl32
    class NMHEADER < FFIStruct
      layout :hdr,     NMHDR,
             :iItem,   :int,
             :iButton, :int,
             :pitem,   :pointer  #  *pitem
    end
  end
end
