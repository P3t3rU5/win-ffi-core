require 'win-ffi/gdi32/struct/text/log_font'

module WinFFI
  module User32
    class NONCLIENTMETRICS < FFIStruct
      layout(*[
                 :cbSize,           :uint,
                 :iBorderWidth,     :int,
                 :iScrollWidth,     :int,
                 :iScrollHeight,    :int,
                 :iCaptionWidth,    :int,
                 :iCaptionHeight,   :int,
                 :lfCaptionFont,    Gdi32::LOGFONT,
                 :iSmCaptionWidth,  :int,
                 :iSmCaptionHeight, :int,
                 :lfSmCaptionFont,  Gdi32::LOGFONT,
                 :iMenuWidth,       :int,
                 :iMenuHeight,      :int,
                 :lfMenuFont,       Gdi32::LOGFONT,
                 :lfStatusFont,     Gdi32::LOGFONT,
                 :lfMessageFont,    Gdi32::LOGFONT,
                 (WindowsVersion >= :vista) ? [:iPaddedBorderWidth, :int] : nil
             ].tap { |layout|
               layout.flatten!
               layout.compact!
             })

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end