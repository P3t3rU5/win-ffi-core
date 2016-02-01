require 'win-ffi/general/struct/rect'

require 'win-ffi/user32/struct/window/window/window_pos'

module WinFFI
  module User32
    # WM_NCCALCSIZE parameter structure
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632606(v=vs.85).aspx
    class NCCALCSIZE_PARAMS < FFIStruct
      layout :rgrc,  [RECT, 3],
             :lppos, WINDOWPOS
    end
  end
end