require 'win-ffi/core/string_utils'

require_relative '../../constant_base'
require_relative '../../enum/font/weight'
require_relative '../../enum/font/charset'
require_relative '../../enum/font/output_precision'
require_relative '../../enum/font/clip_precision'
require_relative '../../enum/font/quality'
require_relative '../../enum/font/family_pitch'

using WinFFI::StringUtils

module WinFFI
  module Gdi32
    # https://docs.microsoft.com/en-us/windows/desktop/api/wingdi/ns-wingdi-taglogfonta
    # https://docs.microsoft.com/en-us/windows/desktop/api/wingdi/ns-wingdi-taglogfontw
    class LOGFONT < FFIAdditions::Struct
      def lfHeight; end
      def lfHeight=(v); end
      def lfWidth; end
      def lfWidth=(v); end
      def lfEscapement; end
      def lfEscapement=(v); end
      def lfOrientation; end
      def lfOrientation=(v); end
      def lfWeight; end
      def lfWeight=(v); end
      def lfItalic; end
      def lfItalic=(v); end
      def lfUnderline; end
      def lfUnderline=(v); end
      def lfStrikeOut; end
      def lfStrikeOut=(v); end
      def lfCharSet; end
      def lfCharSet=(v); end
      def lfOutPrecision; end
      def lfOutPrecision=(v); end
      def lfClipPrecision; end
      def lfClipPrecision=(v); end
      def lfQuality; end
      def lfQuality=(v); end
      def lfPitchAndFamily; end
      def lfPitchAndFamily=(v); end
      def lfFaceName; end
      def lfFaceName=(v); end

      layout lfHeight:         :long,
             lfWidth:          :long,
             lfEscapement:     :long,
             lfOrientation:    :long,
             lfWeight:         FontWeight,
             lfItalic:         :uint8,
             lfUnderline:      :uint8,
             lfStrikeOut:      :uint8,
             lfCharSet:        FontCharset,
             lfOutPrecision:   FontOutputPrecision,
             lfClipPrecision:  FontClipPrecision,
             lfQuality:        FontQuality,
             lfPitchAndFamily: FontFamilyPitch,
             lfFaceName:       WideInlineString.new(LF_FACESIZE)

      alias_method :face_name, :lfFaceName

      encoded_setter(:lfFaceName)
    end
  end
end