require 'win-ffi/comctl32/struct/nm_customdraw'

module WinFFI
  module Comctl32
    class NMTBCUSTOMDRAW < FFIStruct
      layout :nmcd,                 NMCUSTOMDRAW,
             :hbrMonoDither,        :hbrush,
             :hbrLines,             :hbrush, # For drawing lines on buttons,
             :hpenLines,            :hpen, # For drawing lines on buttons,
             :clrText,              :colorref, # Color of text,
             :clrMark,              :colorref, # Color of text bk when marked. (only if TBSTATE_MARKED),
             :clrTextHighlight,     :colorref, # Color of text when highlighted,
             :clrBtnFace,           :colorref, # Background of the button,
             :clrBtnHighlight,      :colorref, # 3D highlight,
             :clrHighlightHotTrack, :colorref, # In conjunction with fHighlightHotTrack,
             :rcText,               RECT, # Rect for text,
             :nStringBkMode,        :int,
             :nHLStringBkMode,      :int,
             :iListGap,             :int
    end
  end
end
