require 'win-ffi/gdi32'

require 'win-ffi/gdi32/struct/log_font'

module WinFFI
  module Gdi32
    # HFONT CreateFontIndirect(_In_  const LOGFONT *lplf)
    encoded_function 'CreateFontIndirect', [LOGFONT.ptr(:in)], :pointer
  end
end