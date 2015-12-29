require 'win-ffi/general/struct/point'

module WinFFI
  module Comctl32
    class HDHITTESTINFO < FFIStruct
      layout :pt,    POINT,
             :flags, :uint,
             :iItem, :int
    end
  end
end
