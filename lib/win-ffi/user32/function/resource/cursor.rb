require 'win-ffi/user32'
require 'win-ffi/shell32/function/resource/icon'

require 'win-ffi/user32/enum/resource/cursor/oem_cursor'

require 'win-ffi/general/struct/rect'
require 'win-ffi/general/struct/point'
require 'win-ffi/user32/struct/resource/cursor_info'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648383(v=vs.85).aspx
    # BOOL WINAPI ClipCursor(  _In_opt_  const RECT *lpRect )
    attach_function 'ClipCursor', [RECT.ptr], :bool

    # HCURSOR WINAPI CopyCursor( _In_  HCURSOR pcur )
    def CopyCursor(hcursor)
      CopyIcon(hcursor)
    end

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648385(v=vs.85).aspx
    # HCURSOR WINAPI CreateCursor(
    #   _In_opt_  HINSTANCE hInst,
    #   _In_      int xHotSpot,
    #   _In_      int yHotSpot,
    #   _In_      int nWidth,
    #   _In_      int nHeight,
    #   _In_      const VOID *pvANDPlane,
    #   _In_      const VOID *pvXORPlane )
    attach_function 'CreateCursor', [:hinstance, :int, :int, :int, :int, :pointer, :pointer], :hcursor

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648386(v=vs.85).aspx
    # BOOL WINAPI DestroyCursor( _In_  HCURSOR hCursor )
    attach_function 'DestroyCursor', [:hcursor], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648387(v=vs.85).aspx
    # BOOL WINAPI GetClipCursor( _Out_  LPRECT lpRect )
    attach_function 'GetClipCursor', [RECT.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648388(v=vs.85).aspx
    # HCURSOR WINAPI GetCursor(void)
    attach_function 'GetCursor', [], :hcursor

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648389(v=vs.85).aspx
    # BOOL WINAPI GetCursorInfo( _Inout_  PCURSORINFO pci )
    attach_function 'GetCursorInfo', [CURSORINFO.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648390(v=vs.85).aspx
    # BOOL WINAPI GetCursorPos( _Out_  LPPOINT lpPoint )
    attach_function 'GetCursorPos', [POINT.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648391(v=vs.85).aspx
    # HCURSOR LoadCursor(
    #   __in_opt  HINSTANCE hInstance,
    #   __in      LPCTSTR   lpCursorName)
    encoded_function 'LoadCursor', [:hinstance, :pointer], :hcursor

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648392(v=vs.85).aspx
    # HCURSOR WINAPI LoadCursorFromFile( _In_  LPCTSTR lpFileName )
    encoded_function 'LoadCursorFromFile', [:string], :hcursor

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648393(v=vs.85).aspx
    # HCURSOR WINAPI SetCursor( _In_opt_  HCURSOR hCursor )
    attach_function 'SetCursor', [:hcursor], :hcursor

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648394(v=vs.85).aspx
    # BOOL WINAPI SetCursorPos(
    #   _In_  int X,
    #   _In_  int Y )
    attach_function 'SetCursorPos', [:int, :int], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648395(v=vs.85).aspx
    # BOOL WINAPI SetSystemCursor(
    #   _In_  HCURSOR hcur,
    #   _In_  DWORD id )
    attach_function 'SetSystemCursor', [:hcursor, :dword], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648396(v=vs.85).aspx
    # int WINAPI ShowCursor( _In_  BOOL bShow )
    attach_function 'ShowCursor', [:bool], :int

    if WindowsVersion >= :vista
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa969464(v=vs.85).aspx
      # BOOL WINAPI GetPhysicalCursorPos( _Out_  LPPOINT lpPoint )
      attach_function 'GetPhysicalCursorPos', [POINT.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa969465(v=vs.85).aspx
      # BOOL WINAPI SetPhysicalCursorPos(
      #   _In_  int X,
      #   _In_  int Y )
      attach_function 'SetPhysicalCursorPos', [:int, :int], :bool
    end
  end
end