require 'win-ffi/gdi32/enum/text/get_character_placement_class'

module WinFFI
  module Gdi32
    # https://msdn.microsoft.com/en-us/library/dd144842(v=vs.85).aspx
    class GCP_RESULTS < FFIStruct
      layout :lStructSize, :dword,
             :lpOutString, :string,
             :lpOrder,     :pointer, # uint
             :lpDx,        :pointer, # int
             :lpCaretPos,  :pointer, # int
             :lpClass,     GetCharacterPlacementClass,
             :lpGlyphs,    :string,
             :nGlyphs,     :uint,
             :nMaxFit,     :int
    end
  end
end