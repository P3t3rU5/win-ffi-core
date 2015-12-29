require 'win-ffi/comctl32/struct/nm_hdr'

module WinFFI
  module Comctl32
    class NMOBJECTNOTIFY < FFIStruct
      layout         :hdr,     NMHDR,
                     :iItem,   :int,
                     :IID,     :pointer,
                     :pObject, :pointer, #  *pObject,
                     :hResult, :hresult,
                     :dwFlags, :dword    # control specific flags (hints as to where in iItem it hit)
    end
  end
end