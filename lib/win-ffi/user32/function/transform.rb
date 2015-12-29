require 'win-ffi/user32'

require 'win-ffi/user32/enum/child_window_from_point_ex_flags'

module WinFFI
  module User32
    #BOOL ClientToScreen(
    #  _In_     HWND hWnd,
    #  _Inout_  LPPOINT lpPoint )
    attach_function 'ClientToScreen', [:hwnd, POINT.ptr], :bool

    #HWND WINAPI ChildWindowFromPoint(
    #  _In_  HWND hWndParent,
    #  _In_  POINT Point )
    attach_function 'ChildWindowFromPoint', [:hwnd, POINT], :hwnd

    #HWND WINAPI ChildWindowFromPointEx(
    #  _In_  HWND hwndParent,
    #  _In_  POINT pt,
    #  _In_  UINT uFlags )
    attach_function 'ChildWindowFromPointEx', [:hwnd, POINT, ChildWindowFromPointExFlags], :hwnd

    #int MapWindowPoints(
    #  _In_     HWND hWndFrom,
    #  _In_     HWND hWndTo,
    #  _Inout_  LPPOINT lpPoints,
    #  _In_     UINT cPoints )
    attach_function 'MapWindowPoints', [:hwnd, :hwnd, POINT.ptr, :uint], :int

    if WindowsVersion >= :vista
      #BOOL WINAPI LogicalToPhysicalPoint(
      #  _In_     HWND hWnd,
      #  _Inout_  LPPOINT lpPoint )
      attach_function 'LogicalToPhysicalPoint', [:hwnd, POINT.ptr], :bool

      #BOOL WINAPI PhysicalToLogicalPoint(
      #  _In_     HWND hWnd,
      #  _Inout_  LPPOINT lpPoint )
      attach_function 'PhysicalToLogicalPoint', [:hwnd, POINT.ptr], :bool

      #HWND WINAPI WindowFromPhysicalPoint( _In_  POINT Point )
      attach_function 'WindowFromPhysicalPoint', [POINT.ptr], :hwnd

      if WindowsVersion >= 8.1
        # BOOL LogicalToPhysicalPointForPerMonitorDPI(
        # _In_    HWND    hwnd,
        # _Inout_ LPPOINT lpPoint )
        attach_function 'LogicalToPhysicalPointForPerMonitorDPI', [:hwnd, POINT.ptr], :bool

        # BOOL PhysicalToLogicalPointForPerMonitorDPI(
        # _In_    HWND    hwnd,
        # _Inout_ LPPOINT lpPoint )
        attach_function 'PhysicalToLogicalPointForPerMonitorDPI', [:hwnd, POINT.ptr], :bool
      end
    end

    #BOOL ScreenToClient(
    #  _In_  HWND hWnd,
    #  LPPOINT lpPoint )
    attach_function 'ScreenToClient', [:hwnd, POINT.ptr], :bool

    #HWND WINAPI WindowFromPoint( _In_  POINT Point )
    attach_function 'WindowFromPoint', [POINT.ptr], :hwnd
  end
end