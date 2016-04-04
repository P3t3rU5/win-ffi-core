require 'win-ffi/gdi32/struct/text/log_font'

module WinFFI
  module Gdi32
    class ENUMLOGFONTEX < FFIStruct
      layout :elfLogFont,  LOGFONT,
             :elfFullName, WideInlineString.new(64),
             :elfStyle,    WideInlineString.new(32),
             :elfScript,   WideInlineString.new(32)
    end
  end
end