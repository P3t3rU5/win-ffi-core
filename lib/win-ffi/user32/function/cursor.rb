require 'win-ffi/user32'

require 'win-ffi/general/struct/rect'
require 'win-ffi/general/struct/point'
require 'win-ffi/user32/struct/info/cursor_info'

module WinFFI
  module User32
    #BOOL WINAPI ClipCursor(  _In_opt_  const RECT *lpRect )
    attach_function 'ClipCursor', [RECT.ptr], :bool

    #HCURSOR WINAPI CopyCursor( _In_  HCURSOR pcur )
    #define CopyCursor(pcur) ((HCURSOR)CopyIcon((HICON)(pcur)))
    def CopyCursor(hcursor)
      CopyIcon(hcursor)
    end

    #HCURSOR WINAPI CreateCursor(
    #  _In_opt_  HINSTANCE hInst,
    #  _In_      int xHotSpot,
    #  _In_      int yHotSpot,
    #  _In_      int nWidth,
    #  _In_      int nHeight,
    #  _In_      const VOID *pvANDPlane,
    #  _In_      const VOID *pvXORPlane )
    attach_function 'CreateCursor', [:hinstance, :int, :int, :int, :int, :pointer, :pointer], :hcursor

    #BOOL WINAPI DestroyCursor( _In_  HCURSOR hCursor )
    attach_function 'DestroyCursor', [:hcursor], :bool

    #BOOL WINAPI GetClipCursor( _Out_  LPRECT lpRect )
    attach_function 'GetClipCursor', [RECT.ptr], :bool

    #HCURSOR WINAPI GetCursor(void)
    attach_function 'GetCursor', [], :hcursor

    #BOOL WINAPI GetCursorInfo( _Inout_  PCURSORINFO pci )
    attach_function 'GetCursorInfo', [CURSORINFO.ptr], :bool

    #BOOL WINAPI GetCursorPos( _Out_  LPPOINT lpPoint )
    attach_function 'GetCursorPos', [POINT.ptr], :bool

    #HCURSOR LoadCursor(
    #  __in_opt  HINSTANCE hInstance,
    #  __in      LPCTSTR   lpCursorName)
    encoded_function 'LoadCursor', [:hinstance, :pointer], :hcursor

    #HCURSOR WINAPI LoadCursorFromFile( _In_  LPCTSTR lpFileName )
    encoded_function 'LoadCursorFromFile', [:string], :hcursor

    #HCURSOR WINAPI SetCursor( _In_opt_  HCURSOR hCursor )
    attach_function 'SetCursor', [:hcursor], :hcursor

    #BOOL WINAPI SetCursorPos(
    #  _In_  int X,
    #  _In_  int Y )
    attach_function 'SetCursorPos', [:int, :int], :bool

    #BOOL WINAPI SetSystemCursor(
    #  _In_  HCURSOR hcur,
    #  _In_  DWORD id )
    attach_function 'SetSystemCursor', [:hcursor, :dword], :bool

    #int WINAPI ShowCursor( _In_  BOOL bShow )
    attach_function 'ShowCursor', [:bool], :int

    if WindowsVersion >= :vista
      #BOOL WINAPI GetPhysicalCursorPos( _Out_  LPPOINT lpPoint )
      attach_function 'GetPhysicalCursorPos', [POINT.ptr], :bool

      #BOOL WINAPI SetPhysicalCursorPos(
      #  _In_  int X,
      #  _In_  int Y )
      attach_function 'SetPhysicalCursorPos', [:int, :int], :bool
    end
  end
end