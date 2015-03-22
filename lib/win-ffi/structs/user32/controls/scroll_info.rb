module WinFFI
  module User32
    class SCROLLINFO < FFIStruct
      layout :cbSize,    :uint,
             :fMask,     :uint,
             :nMin,      :int,
             :nMax,      :int,
             :nPage,     :uint,
             :nPos,      :int,
             :nTrackPos, :int
    end
  end
end