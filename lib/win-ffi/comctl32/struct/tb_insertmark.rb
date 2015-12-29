module WinFFI
  module Comctl32
    class TBINSERTMARK < FFIStruct
      layout :iButton, :int,
             :dwFlags, :dword
    end
  end
end