require 'win-ffi/comctl32/struct/nm_hdr'

module WinFFI
  module Comctl32

    class NMHDDISPINFO < FFIStruct
      layout :hdr,        NMHDR,
             :iItem,      :int,
             :mask,       :uint,
             :pszText,    :string,
             :cchTextMax, :int,
             :iImage,     :int,
             :lParam,     :lparam
    end
  end
end