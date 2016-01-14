module WinFFI
  module User32
    # Struct pointed to by WM_GETMINMAXINFO lParam
    class MINMAXINFO < FFIStruct
      layout :ptReserved,     :point,
             :ptMaxSize,      :point,
             :ptMaxPosition,  :point,
             :ptMinTrackSize, :point,
             :ptMaxTrackSize, :point
    end
  end
end