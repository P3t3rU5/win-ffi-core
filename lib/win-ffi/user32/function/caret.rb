require 'win-ffi/user32'

module WinFFI
  module User32
    #BOOL WINAPI CreateCaret(
    #  _In_      HWND hWnd,
    #  _In_opt_  HBITMAP hBitmap,
    #  _In_      int nWidth,
    #  _In_      int nHeight )
    attach_function 'CreateCaret', [:hwnd, :hbitmap, :int, :int], :bool

    #BOOL WINAPI DestroyCaret(void)
    attach_function 'DestroyCaret', [], :bool

    #UINT WINAPI GetCaretBlinkTime(void)
    attach_function 'GetCaretBlinkTime', [], :uint

    #BOOL WINAPI GetCaretPos( _Out_  LPPOINT lpPoint )
    attach_function 'GetCaretPos', [POINT.ptr], :bool

    #BOOL WINAPI HideCaret( _In_opt_  HWND hWnd )
    attach_function 'HideCaret', [:hwnd], :bool

    #BOOL WINAPI SetCaretBlinkTime( _In_  UINT uMSeconds )
    attach_function 'SetCaretBlinkTime', [:uint], :bool

    #BOOL WINAPI SetCaretPos(
    #  _In_  int X,
    #  _In_  int Y )
    attach_function 'SetCaretPos', [:int, :int], :bool

    #BOOL WINAPI ShowCaret( _In_opt_  HWND hWnd )
    attach_function 'ShowCaret', [:hwnd], :bool

  end
end