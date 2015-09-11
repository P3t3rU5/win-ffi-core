require 'win-ffi/functions/gdi32'

module WinFFI
  module Gdi32
    # HFONT CreateFontIndirect(_In_  const LOGFONT *lplf)
    attach_function 'CreateFontIndirectA', [LOGFONT.ptr(:in)], :pointer
    attach_function 'CreateFontIndirectW', [LOGFONT.ptr(:in)], :pointer
  end
end