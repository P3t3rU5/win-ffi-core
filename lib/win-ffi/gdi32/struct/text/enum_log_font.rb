require 'win-ffi/gdi32/struct/text/log_font'

LF_FULLFACESIZE = 64
LF_FACESIZE = 32

module WinFFI
  module Gdi32
    # https://msdn.microsoft.com/en-us/library/dd162626(v=vs.85).aspx
    class ENUMLOGFONT < FFIStruct
      layout :elfLogFont,  LOGFONT,
             :elfFullName, WideInlineString.new(64),
             :elfStyle,    WideInlineString.new(32)

      def family
        elfFullName
      end

      def style
        elfStyle
      end

      def font
        elfLogFont
      end
    end
  end
end