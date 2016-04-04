module WinFFI
  module Gdi32
    # https://msdn.microsoft.com/en-us/library/dd145132(v=vs.85).aspx
    class TEXTMETRIC < FFIStruct
      layout :tmHeight,           :long,
             :tmAscent,           :long,
             :tmDescent,          :long,
             :tmInternalLeading,  :long,
             :tmExternalLeading,  :long,
             :tmAveCharWidth,     :long,
             :tmMaxCharWidth,     :long,
             :tmWeight,           :long,
             :tmOverhang,         :long,
             :tmDigitizedAspectX, :long,
             :tmDigitizedAspectY, :long,
             :tmFirstChar,        :char,
             :tmLastChar,         :char,
             :tmDefaultChar,      :char,
             :tmBreakChar,        :char,
             :tmItalic,           :byte,
             :tmUnderlined,       :byte,
             :tmStruckOut,        :byte,
             :tmPitchAndFamily,   :byte,
             :tmCharSet,          :byte
    end
  end
end