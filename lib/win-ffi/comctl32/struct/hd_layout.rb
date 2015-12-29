module WinFFI
  module Comctl32
    class HDLAYOUT < FFIStruct
      layout :prc, :pointer, #  *prc,
             :pwpos, :pointer #  *pwpos
    end
  end
end