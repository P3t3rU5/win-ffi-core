require 'win-ffi/general/struct/rect'

module WinFFI
  # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162768(v=vs.85).aspx
  class PAINTSTRUCT < FFIStruct
    layout :hdc,         :hdc,
           :fErase,      :bool,
           :rcPaint,     RECT,
           :fRestore,    :bool,
           :fIncUpdate,  :bool,
           :rgbReserved, [:byte, 32]
  end
end