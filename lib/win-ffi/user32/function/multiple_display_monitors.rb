require 'win-ffi/user32'

require 'win-ffi/general/struct/rect'
require 'win-ffi/general/struct/point'

require 'win-ffi/user32/enum/monitor'

require 'win-ffi/user32/struct/info/monitor_info'

module WinFFI
  module User32

    typedef :pointer, :hmonitor

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145061(v=vs.85).aspx
    # BOOL CALLBACK MonitorEnumProc(
    #   _In_  HMONITOR hMonitor,
    #   _In_  HDC hdcMonitor,
    #   _In_  LPRECT lprcMonitor,
    #   _In_  LPARAM dwData )
    MonitorEnumProc = callback 'MonitorEnumProc', [:hmonitor, :hdc, RECT.ptr(:in), :lparam], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162610(v=vs.85).aspx
    # BOOL EnumDisplayMonitors(
    #   _In_  HDC hdc,
    #   _In_  LPCRECT lprcClip,
    #   _In_  MONITORENUMPROC lpfnEnum,
    #   _In_  LPARAM dwData )
    attach_function 'EnumDisplayMonitors', [:hdc, RECT.ptr(:in), MonitorEnumProc, :lparam], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd144901(v=vs.85).aspx
    # BOOL GetMonitorInfo(
    #   _In_   HMONITOR hMonitor,
    #   _Out_  LPMONITORINFO lpmi)
    encoded_function 'GetMonitorInfo', [:hmonitor, MONITORINFO.ptr(:out)], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145062(v=vs.85).aspx
    # HMONITOR MonitorFromPoint(
    #   _In_  POINT pt,
    #   _In_  DWORD dwFlags )
    attach_function 'MonitorFromPoint', [POINT.ptr(:in), Monitor], :hmonitor

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145062(v=vs.85).aspx
    # HMONITOR MonitorFromRect(
    #   _In_  LPCRECT lprc,
    #   _In_  DWORD dwFlags )
    attach_function 'MonitorFromRect', [RECT.ptr(:in), Monitor], :hmonitor

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145064(v=vs.85).aspx
    # HMONITOR MonitorFromWindow(
    #   _In_  HWND hwnd,
    #   _In_  DWORD dwFlags )
    attach_function 'MonitorFromWindow', [:hwnd, Monitor], :hmonitor
  end
end