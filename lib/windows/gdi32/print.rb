module WinFFI
  module Gdi32
    module Print
      extend LibBase

      ffi_lib 'user32'


      #BOOL WINAPI IsWindowRedirectedForPrint( _In_    HWND hWnd )
      attach_function 'IsWindowRedirectedForPrint', [:hwnd], :bool

      #BOOL PrintWindow(
      #  HWND hwnd,
      #  HDC hdcBlt,
      #  UINT nFlags )
      attach_function 'PrintWindow', [:hwnd, :hdc, :uint], :bool

    end
  end
end