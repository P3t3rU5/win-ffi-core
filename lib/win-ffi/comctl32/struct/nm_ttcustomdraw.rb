require 'win-ffi/comctl32/struct/nm_customdraw'

module WinFFI
  module Comctl32
    class NMTTCUSTOMDRAW < FFIStruct
      layout :nmcd,       NMCUSTOMDRAW,
             :uDrawFlags, :uint
    end
  end
end