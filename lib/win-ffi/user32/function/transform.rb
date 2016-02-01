require 'win-ffi/user32'

require 'win-ffi/general/struct/point'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd183434(v=vs.85).aspx
    # BOOL ClientToScreen(
    #   _In_     HWND hWnd,
    #   _Inout_  LPPOINT lpPoint )
    attach_function 'ClientToScreen', [:hwnd, POINT.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145046(v=vs.85).aspx
    # int MapWindowPoints(
    #   _In_     HWND hWndFrom,
    #   _In_     HWND hWndTo,
    #   _Inout_  LPPOINT lpPoints,
    #   _In_     UINT cPoints )
    attach_function 'MapWindowPoints', [:hwnd, :hwnd, POINT.ptr, :uint], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162952(v=vs.85).aspx
    # BOOL ScreenToClient(
    #   _In_  HWND hWnd,
    #   LPPOINT lpPoint )
    attach_function 'ScreenToClient', [:hwnd, POINT.ptr], :bool

    if WindowsVersion >= 8.1
      # https://msdn.microsoft.com/en-us/library/windows/desktop/dn384110(v=vs.85).aspx
      # BOOL LogicalToPhysicalPointForPerMonitorDPI(
      # _In_    HWND    hwnd,
      # _Inout_ LPPOINT lpPoint )
      attach_function 'LogicalToPhysicalPointForPerMonitorDPI', [:hwnd, POINT.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dn384112(v=vs.85).aspx
      # BOOL PhysicalToLogicalPointForPerMonitorDPI(
      # _In_    HWND    hwnd,
      # _Inout_ LPPOINT lpPoint )
      attach_function 'PhysicalToLogicalPointForPerMonitorDPI', [:hwnd, POINT.ptr], :bool
    end
  end
end