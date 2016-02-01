require 'win-ffi/general/struct/point'

module WinFFI
  module User32
    # Struct pointed to by WM_GETMINMAXINFO lParam
    class MINMAXINFO < FFIStruct
      layout :ptReserved,     POINT,
             :ptMaxSize,      POINT,
             :ptMaxPosition,  POINT,
             :ptMinTrackSize, POINT,
             :ptMaxTrackSize, POINT
    end
  end
end