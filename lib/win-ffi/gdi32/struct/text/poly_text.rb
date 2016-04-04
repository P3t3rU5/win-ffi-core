require 'win-ffi/gdi32/enum/text/ext_text_out_flag'

require 'win-ffi/general/struct/rect'

module WinFFI
  module Gdi32
    class POLYTEXT < FFIStruct
      layout :x,       :int,
             :y,       :int,
             :n,       :uint,
             :lpstr,   :string,
             :uiFlags, ExtTextOutFlag,
             :rcl,     RECT,
             :pdx,     :pointer
    end
  end
end