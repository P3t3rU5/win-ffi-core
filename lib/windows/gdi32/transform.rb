module WinFFI
  module Gdi32
    module Transform
      extend LibBase

      ffi_lib 'user32'

      #BOOL ClientToScreen(
      #  _In_     HWND hWnd,
      #  _Inout_  LPPOINT lpPoint )
      attach_function 'ClientToScreen', [:hwnd, POINT.ptr], :bool

      #int MapWindowPoints(
      #  _In_     HWND hWndFrom,
      #  _In_     HWND hWndTo,
      #  _Inout_  LPPOINT lpPoints,
      #  _In_     UINT cPoints )
      attach_function 'MapWindowPoints', [:hwnd, :hwnd, POINT.ptr, :uint], :int

      #BOOL ScreenToClient(
      #  _In_  HWND hWnd,
      #  LPPOINT lpPoint )
      attach_function 'ScreenToClient', [:hwnd, POINT.ptr], :bool


    end
  end
end