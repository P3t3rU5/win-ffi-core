require 'win-ffi/user32'

require 'win-ffi/general/struct/point'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648399(v=vs.85).aspx
    # BOOL WINAPI CreateCaret(
    #   _In_      HWND hWnd,
    #   _In_opt_  HBITMAP hBitmap,
    #   _In_      int nWidth,
    #   _In_      int nHeight )
    attach_function 'CreateCaret', [:hwnd, :hbitmap, :int, :int], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648400(v=vs.85).aspx
    # BOOL WINAPI DestroyCaret(void)
    attach_function 'DestroyCaret', [], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648401(v=vs.85).aspx
    # UINT WINAPI GetCaretBlinkTime(void)
    attach_function 'GetCaretBlinkTime', [], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648402(v=vs.85).aspx
    # BOOL WINAPI GetCaretPos( _Out_  LPPOINT lpPoint )
    attach_function 'GetCaretPos', [POINT.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648403(v=vs.85).aspx
    # BOOL WINAPI HideCaret( _In_opt_  HWND hWnd )
    attach_function 'HideCaret', [:hwnd], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648404(v=vs.85).aspx
    # BOOL WINAPI SetCaretBlinkTime( _In_  UINT uMSeconds )
    attach_function 'SetCaretBlinkTime', [:uint], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648405(v=vs.85).aspx
    # BOOL WINAPI SetCaretPos(
    #   _In_  int X,
    #   _In_  int Y )
    attach_function 'SetCaretPos', [:int, :int], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648406(v=vs.85).aspx
    # BOOL WINAPI ShowCaret( _In_opt_  HWND hWnd )
    attach_function 'ShowCaret', [:hwnd], :bool
  end
end