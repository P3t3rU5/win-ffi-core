require 'win-ffi/user32'

module WinFFI
  module User32
    #BOOL WINAPI IsWindowRedirectedForPrint( _In_    HWND hWnd )
    attach_function 'IsWindowRedirectedForPrint', [:hwnd], :bool

    #BOOL PrintWindow(
    #  HWND hwnd,
    #  HDC hdcBlt,
    #  UINT nFlags )
    attach_function 'PrintWindow', [:hwnd, :hdc, :uint], :bool
  end
end