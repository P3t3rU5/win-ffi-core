module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647561(v=vs.85).aspx
    class MDINEXTMENU < FFIStruct
      layout :hmenuIn,   :hmenu,
             :hmenuNext, :hmenu,
             :hwndNext,  :hwnd
    end
  end
end