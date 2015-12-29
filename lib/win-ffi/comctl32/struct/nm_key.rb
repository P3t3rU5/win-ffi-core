require 'win-ffi/comctl32/struct/nm_hdr'

module WinFFI
  module Comctl32
    class NMKEY < FFIStruct
      layout :hdr,    NMHDR,
             :nVKey,  :uint,
             :uFlags, :uint
    end
  end
end
