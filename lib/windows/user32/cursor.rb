module WinFFI
  module User32
    module Cursor

      extend LibBase

      ffi_lib 'user32'

      class CURSORINFO < FFI::Struct
        layout :cbSize,      :dword,
               :flags,       :dword,
               :hCursor,     :hcursor,
               :ptScreenPos, POINT
      end

      #BOOL WINAPI ClipCursor(  _In_opt_  const RECT *lpRect )
      attach_function 'ClipCursor', [RECT.ptr], :bool

      #HCURSOR WINAPI CopyCursor( _In_  HCURSOR pcur )
      #attach_function 'CopyCursor', [:hcursor], :hcursor

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

      #BOOL WINAPI GetPhysicalCursorPos( _Out_  LPPOINT lpPoint )
      attach_function 'GetPhysicalCursorPos', [POINT.ptr], :bool

      #HCURSOR LoadCursor(
      #  __in_opt  HINSTANCE hInstance,
      #  __in      LPCTSTR   lpCursorName)
      attach_function 'LoadCursorA', [:hinstance, :pointer], :pointer
      attach_function 'LoadCursorW', [:hinstance, :pointer], :hcursor

      #HCURSOR WINAPI LoadCursorFromFile( _In_  LPCTSTR lpFileName )
      attach_function 'LoadCursorFromFileA', [:string], :hcursor
      attach_function 'LoadCursorFromFileW', [:string], :hcursor

      #HCURSOR WINAPI SetCursor( _In_opt_  HCURSOR hCursor )
      attach_function 'SetCursor', [:hcursor], :hcursor

      #BOOL WINAPI SetCursorPos(
      #  _In_  int X,
      #  _In_  int Y )
      attach_function 'SetCursorPos', [:int, :int], :bool

      #BOOL WINAPI SetPhysicalCursorPos(
      #  _In_  int X,
      #  _In_  int Y )
      attach_function 'SetPhysicalCursorPos', [:int, :int], :bool

      #BOOL WINAPI SetSystemCursor(
      #  _In_  HCURSOR hcur,
      #  _In_  DWORD id )
      attach_function 'SetSystemCursor', [:hcursor, :dword], :bool

      #int WINAPI ShowCursor( _In_  BOOL bShow )
      attach_function 'ShowCursor', [:bool], :int

    end
  end
end