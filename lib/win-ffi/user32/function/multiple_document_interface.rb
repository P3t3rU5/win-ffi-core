require 'win-ffi/user32'

require 'win-ffi/user32/struct/msg'

module WinFFI
  module User32
    #HWND WINAPI CreateMDIWindow(
    #  _In_      LPCTSTR lpClassName,
    #  _In_      LPCTSTR lpWindowName,
    #  _In_      DWORD dwStyle,
    #  _In_      int X,
    #  _In_      int Y,
    #  _In_      int nWidth,
    #  _In_      int nHeight,
    #  _In_opt_  HWND hWndParent,
    #  _In_opt_  HINSTANCE hInstance,
    #  _In_      LPARAM lParam )
    encoded_function 'CreateMDIWindow', [:string, :string, WindowStyle, :int, :int, :int, :int, :hwnd, :hinstance, :lparam], :hwnd

    #LRESULT WINAPI DefFrameProc(
    #  _In_  HWND hWnd,
    #  _In_  HWND hWndMDIClient,
    #  _In_  UINT uMsg,
    #  _In_  WPARAM wParam,
    #  _In_  LPARAM lParam )
    encoded_function 'DefFrameProc', [:hwnd, :hwnd, :uint, :wparam, :lparam], :lresult

    #LRESULT WINAPI DefMDIChildProc(
    #  _In_  HWND hWnd,
    #  _In_  UINT uMsg,
    #  _In_  WPARAM wParam,
    #  _In_  LPARAM lParam )
    encoded_function 'DefMDIChildProc', [:hwnd, :uint, :wparam, :lparam], :lresult

    #BOOL WINAPI TranslateMDISysAccel(
    #  _In_  HWND hWndClient,
    #  _In_  LPMSG lpMsg )
    attach_function 'TranslateMDISysAccel', [:hwnd, MSG.ptr], :bool

  end
end