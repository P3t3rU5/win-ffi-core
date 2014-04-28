module WinFFI
  class PAINTSTRUCT < FFI::Struct
    layout :hdc,         :hdc,
           :fErase,      :bool,
           :rcPaint,     RECT,
           :fRestore,    :bool,
           :fIncUpdate,  :bool,
           :rgbReserved, [:uint8, 32]
  end
end