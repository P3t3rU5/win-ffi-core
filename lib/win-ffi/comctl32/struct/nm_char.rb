require 'win-ffi/comctl32/struct/nm_hdr'

module WinFFI
  module Comctl32
    class NMCHAR < FFIStruct
      layout :hdr,        NMHDR,
             :ch,         :uint,
             :dwItemPrev, :dword, # Item previously selected,
             :dwItemNext, :dword  # Item to be selected
    end
  end
end