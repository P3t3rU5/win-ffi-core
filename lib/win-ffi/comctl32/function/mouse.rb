module WinFFI
  module ComCtl32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646266(v=vs.85).aspx
    # BOOL WINAPI _TrackMouseEvent(
    #   _Inout_  LPTRACKMOUSEEVENT lpEventTrack )
    attach_function '_TrackMouseEvent', [TRACKMOUSEEVENT.ptr], :bool
  end
end

