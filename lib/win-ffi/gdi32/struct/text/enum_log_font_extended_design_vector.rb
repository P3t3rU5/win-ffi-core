require 'win-ffi/gdi32/struct/text/enum_log_font_extended'
require 'win-ffi/gdi32/struct/design_vector'

module WinFFI
  module Gdi32
    class ENUMLOGFONTEXDV < FFIStruct
      layout :elfEnumLogfontEx, ENUMLOGFONTEX,
             :elfDesignVector,  DESIGNVECTOR
    end
  end
end