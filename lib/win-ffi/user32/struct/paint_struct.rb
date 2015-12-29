require 'win-ffi/general/struct/rect'

module WinFFI
  class PAINTSTRUCT < FFIStruct
    layout :hdc,         :hdc,
           :fErase,      :bool,
           :rcPaint,     RECT,
           :fRestore,    :bool,
           :fIncUpdate,  :bool,
           :rgbReserved, [:uint8, 32]
  end
end