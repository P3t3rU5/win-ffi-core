module WinFFI
  module Gdi32
    module MultipleDisplayMonitors
      extend LibBase

      ffi_lib 'user32'

      #BOOL EnumDisplayMonitors(
      #  _In_  HDC hdc,
      #  _In_  LPCRECT lprcClip,
      #  _In_  MONITORENUMPROC lpfnEnum,
      #  _In_  LPARAM dwData )
      attach_function 'EnumDisplayMonitors', [:hdc, RECT.ptr, :pointer, :lparam], :bool

      #BOOL GetMonitorInfo(
      #  _In_   HMONITOR hMonitor,
      #  _Out_  LPMONITORINFO lpmi)
      attach_function 'GetMonitorInfoA', [:hmonitor, :pointer], :bool
      attach_function 'GetMonitorInfoW', [:hmonitor, :pointer], :bool

      #BOOL CALLBACK MonitorEnumProc(
      #  _In_  HMONITOR hMonitor,
      #  _In_  HDC hdcMonitor,
      #  _In_  LPRECT lprcMonitor,
      #  _In_  LPARAM dwData )
      callback 'MonitorEnumProc', [:hmonitor, :hdc, RECT.ptr, :lparam], :bool

      #HMONITOR MonitorFromPoint(
      #  _In_  POINT pt,
      #  _In_  DWORD dwFlags )
      attach_function 'MonitorFromPoint', [POINT, :dword], :hmonitor

      #HMONITOR MonitorFromRect(
      #  _In_  LPCRECT lprc,
      #  _In_  DWORD dwFlags )
      attach_function 'MonitorFromRect', [RECT.ptr, :dword], :hmonitor

      #HMONITOR MonitorFromWindow(
      #  _In_  HWND hwnd,
      #  _In_  DWORD dwFlags )
      attach_function 'MonitorFromWindow', [:hwnd, :dword], :hmonitor

    end
  end
end