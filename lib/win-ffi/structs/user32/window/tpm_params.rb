require 'win-ffi/structs/rect'

module WinFFI
  module User32
    class TPMPARAMS  < FFIStruct
      layout :cbSize,    :uint,
             :rcExclude, RECT
    end
  end
end