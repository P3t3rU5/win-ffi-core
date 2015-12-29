require 'win-ffi/comctl32/struct/nm_hdr'

module WinFFI
  module Comctl32
    class NMMOUSE < FFIStruct
      layout         :hdr,        NMHDR,
                     :dwItemSpec, :dword,
                     :dwItemData, :dword,
                     :pt,         POINT,
                     :dwHitInfo,  :lparam # any specifics about where on the item or control the mouse is
    end
  end
end