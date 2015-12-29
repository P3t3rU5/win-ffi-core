module WinFFI
  module User32
    class CLIENTCREATESTRUCT < FFIStruct
      layout :hWindowMenu, :handle,
             :idFirstChild, :uint
    end
  end
end