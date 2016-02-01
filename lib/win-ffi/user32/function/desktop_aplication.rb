require 'win-ffi/user32'

require 'win-ffi/general/struct/rect'
require 'win-ffi/user32/enum/color_types'

module WinFFI
  module User32
    # Filled shape
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162719(v=vs.85).aspx
    # int FillRect(
    #   _In_  HDC hDC,
    #   _In_  const RECT *lprc,
    #   _In_  HBRUSH hbr )
    attach_function 'FillRect', [:hdc, RECT.ptr, :hbrush], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd144838(v=vs.85).aspx
    # int FrameRect(
    #   _In_  HDC hDC,
    #   _In_  const RECT *lprc,
    #   _In_  HBRUSH hbr )
    attach_function 'FrameRect', [:hdc, RECT.ptr, :hbrush], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145007(v=vs.85).aspx
    # BOOL InvertRect(
    #   _In_  HDC hDC,
    #   _In_  const RECT *lprc )
    attach_function 'InvertRect', [:hdc, RECT.ptr], :bool

    # Bitmap
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145033(v=vs.85).aspx
    # HBITMAP LoadBitmap(
    #   _In_  HINSTANCE hInstance,
    #   _In_  LPCTSTR lpBitmapName )
    encoded_function 'LoadBitmap', [:hinstance, :string], :hbitmap

    # Brush
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd144927(v=vs.85).aspx
    # HBRUSH GetSysColorBrush( _In_  int nIndex )
    attach_function 'GetSysColorBrush', [ColorTypes], :int

    if WindowsVersion >= :xp

      require 'win-ffi/user32/enum/set_last_error_ex_code'

      # Error
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms680629(v=vs.85).aspx
      # void WINAPI SetLastErrorEx(
      #   _In_  DWORD dwErrCode,
      #   _In_  DWORD dwType )
      attach_function 'SetLastErrorEx', [SetLastErrorExCode, :dword], :void

      # Thread
      #BOOL WINAPI AttachThreadInput(
      #  _In_  DWORD idAttach,
      #  _In_  DWORD idAttachTo,
      #  _In_  BOOL fAttach )
      attach_function 'AttachThreadInput', [:dword, :dword, :bool], :bool

      # Print
      require 'win-ffi/user32/enum/print_window_flags'

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162869(v=vs.85).aspx
      # BOOL PrintWindow(
      #   HWND hwnd,
      #   HDC hdcBlt,
      #   UINT nFlags )
      attach_function 'PrintWindow', [:hwnd, :hdc, PrintWindowFlags], :bool

      if WindowsVersion >= :vista
        # https://msdn.microsoft.com/en-us/library/windows/desktop/gg583869(v=vs.85).aspx
        #BOOL WINAPI IsWindowRedirectedForPrint( _In_    HWND hWnd )
        attach_function 'IsWindowRedirectedForPrint', [:hwnd], :bool
      end
    end
  end
end