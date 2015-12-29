require 'win-ffi/comctl32/struct/nm_hdr'

module WinFFI
  module Comctl32
    if WindowsVersion >= :vista
      class NMCUSTOMTEXT < FFIStruct
        layout :hdr,      NMHDR,
               :hDC,      :hdc,
               :lpString, :string,
               :nCount,   :int,
               :lpRect,   RECT,
               :uFormat,  :uint,
               :fLink,    :bool
      end
    end
  end
end