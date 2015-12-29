require 'win-ffi/user32'

module WinFFI
  module User32
    #LRESULT DefWindowProc(
    #  __in  HWND   hWnd,
    #  __in  UINT   Msg,
    #  __in  WPARAM wParam,
    #  __in  LPARAM lParam)
    encoded_function 'DefWindowProc', [:hwnd, :uint, :wparam, :lparam], :lresult

    #LRESULT WINAPI CallWindowProc(
    #  _In_  WNDPROC lpPrevWndFunc,
    #  _In_  HWND hWnd,
    #  _In_  UINT Msg,
    #  _In_  WPARAM wParam,
    #  _In_  LPARAM lParam )
    encoded_function 'CallWindowProc', [:pointer, :hwnd, :uint, :wparam, :lparam], :lresult

    #LRESULT CALLBACK WindowProc(
    #  _In_  HWND hwnd,
    #  _In_  UINT uMsg,
    #  _In_  WPARAM wParam,
    #  _In_  LPARAM lParam )
    WindowProc = callback :WindowProc, [:hwnd, :uint, :wparam, :lparam], :lresult
  end
end