module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648779(v=vs.85).aspx
    # DDEDATA structure
    # WM_DDE_DATA parameter structure for hData (LOWORD(lParam)). The actual size of this structure depends on the size
    # of the Value array.
    # TODO
    # class DDEDATA < FFIStruct
    #   layout :short,    :unsigned,
    #          :cfFormat, :short,
    #          :Value,    [:byte, 1]
    # end
  end
end
