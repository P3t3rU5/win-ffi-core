require 'win-ffi/core/string_utils'

require_relative '../../constant_base'
require_relative '../../enum/font/weight'
require_relative '../../enum/font/charset'
require_relative '../../enum/font/output_precision'
require_relative '../../enum/font/clip_precision'
require_relative '../../enum/font/quality'
require_relative '../../enum/font/pitch'
require_relative '../../enum/font/family'

using WinFFI::StringUtils

module WinFFI
  module Gdi32
    # https://docs.microsoft.com/en-us/windows/desktop/api/wingdi/ns-wingdi-taglogfonta
    # https://docs.microsoft.com/en-us/windows/desktop/api/wingdi/ns-wingdi-taglogfontw
    class LOGFONT < FFIAdditions::Struct
      attr_accessor :lfHeight,
                    :lfWidth,
                    :lfEscapement,
                    :lfOrientation,
                    :lfWeight,
                    :lfItalic,
                    :lfUnderline,
                    :lfStrikeOut,
                    :lfCharSet,
                    :lfOutPrecision,
                    :lfClipPrecision,
                    :lfQuality,
                    :lfPitchAndFamily,
                    :lfFaceName

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
             lfPitchAndFamily: :byte,
             lfFaceName:       WideInlineString.new(LF_FACESIZE)

      alias_method :face_name, :lfFaceName

      encoded_setter(:lfFaceName)
    end
  end
end