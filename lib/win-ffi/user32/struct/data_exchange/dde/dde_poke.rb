module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648780(v=vs.85).aspx
    # DDEPOKE structure
    # WM_DDE_POKE parameter structure for hData (LOWORD(lParam)). The actual size of this structure depends on the size
    # of the Value array.
    # TODO
    # class DDEPOKE < FFIStruct
    #   layout :short,    :unsigned,
    #          :cfFormat, ClipboardFormats,
    #          :Value,    [:byte, 1], # This member was named rgb[1] in previous */
    # end
  end
end