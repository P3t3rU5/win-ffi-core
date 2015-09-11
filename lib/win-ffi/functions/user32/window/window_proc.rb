require 'win-ffi/functions/user32'

module WinFFI
  module User32
    #LRESULT DefWindowProc(
    #  __in  HWND   hWnd,
    #  __in  UINT   Msg,
    #  __in  WPARAM wParam,
    #  __in  LPARAM lParam)
    attach_function 'DefWindowProcA', [:hwnd, :uint, :wparam, :lparam], :lresult
    attach_function 'DefWindowProcW', [:hwnd, :uint, :wparam, :lparam], :lresult

    #LRESULT WINAPI CallWindowProc(
    #  _In_  WNDPROC lpPrevWndFunc,
    #  _In_  HWND hWnd,
    #  _In_  UINT Msg,
    #  _In_  WPARAM wParam,
    #  _In_  LPARAM lParam )
    attach_function 'CallWindowProcA', [:pointer, :hwnd, :uint, :wparam, :lparam], :lresult
    attach_function 'CallWindowProcW', [:pointer, :hwnd, :uint, :wparam, :lparam], :lresult

    #LRESULT CALLBACK WindowProc(
    #  _In_  HWND hwnd,
    #  _In_  UINT uMsg,
    #  _In_  WPARAM wParam,
    #  _In_  LPARAM lParam )
    WindowProc = callback :WindowProc, [:hwnd, :uint, :wparam, :lparam], :lresult
  end
end