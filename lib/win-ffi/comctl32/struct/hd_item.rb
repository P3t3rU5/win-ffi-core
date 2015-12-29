module WinFFI
  module Comctl32

    class HDITEM < FFIStruct
      layout :mask,       :uint,
             :cxy,        :int,
             :pszText,    :string,
             :hbm,        :hbitmap,
             :cchTextMax, :int,
             :fmt,        :int,
             :lParam,     :lparam,
             :iImage,     :int,      # index of bitmap in ImageList,
             :iOrder,     :int,      # where to draw this item,
             :type,       :uint,     # [in] filter type (defined what pvFilter is a pointer to),
             :pvFilter,   :pointer, # [in] filter data see above,
             :state,      :uint
    end
  end
end
