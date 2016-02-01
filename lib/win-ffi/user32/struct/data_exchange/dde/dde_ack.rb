module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648776(v=vs.85).aspx
    # DDEACK structure
    #
    # Structure of wStatus (LOWORD(lParam)) in WM_DDE_ACK message sent in response to a WM_DDE_DATA, WM_DDE_REQUEST,
    # WM_DDE_POKE, WM_DDE_ADVISE, or WM_DDE_UNADVISE message.
    # TODO
    # class DDEACK < FFIStruct
    #   layout :short, :ushort,
    #
    # end
  end
end