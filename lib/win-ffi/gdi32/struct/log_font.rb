module WinFFI
  module Gdi32
    class LOGFONT < FFIStruct
      layout :lfHeight,         :long,
             :lfWidth,          :long,
             :lfEscapement,     :long,
             :lfOrientation,    :long,
             :lfWeight,         :long,
             :lfItalic,         :uchar,
             :lfUnderline,      :uchar,
             :lfStrikeOut,      :uchar,
             :lfCharSet,        :uchar,
             :lfOutPrecision,   :uchar,
             :lfClipPrecision,  :uchar,
             :lfQuality,        :uchar,
             :lfPitchAndFamily, :uchar,
             :lfFaceName,       [:ushort, 32]
    end
  end
end