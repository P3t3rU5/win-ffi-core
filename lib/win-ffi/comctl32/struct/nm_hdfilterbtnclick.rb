require 'win-ffi/comctl32/struct/nm_hdr'

module WinFFI
  module Comctl32
    class NMHDFILTERBTNCLICK < FFIStruct
      layout :hdr,   NMHDR,
             :iItem, :int,
             :rc,    RECT
    end
  end
end