require 'win-ffi/user32'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633573(v=vs.85).aspx
    # LRESULT CALLBACK WindowProc(
    #   _In_  HWND hwnd,
    #   _In_  UINT uMsg,
    #   _In_  WPARAM wParam,
    #   _In_  LPARAM lParam )
    WindowProc = callback :WindowProc, [:hwnd, :uint, :wparam, :lparam], :lresult

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633571(v=vs.85).aspx
    # LRESULT WINAPI CallWindowProc(
    #   _In_  WNDPROC lpPrevWndFunc,
    #   _In_  HWND hWnd,
    #   _In_  UINT Msg,
    #   _In_  WPARAM wParam,
    #   _In_  LPARAM lParam )
    encoded_function 'CallWindowProc', [WindowProc, :hwnd, :uint, :wparam, :lparam], :lresult

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633572(v=vs.85).aspx
    # LRESULT DefWindowProc(
    #   __in  HWND   hWnd,
    #   __in  UINT   Msg,
    #   __in  WPARAM wParam,
    #   __in  LPARAM lParam)
    encoded_function 'DefWindowProc', [:hwnd, :uint, :wparam, :lparam], :lresult
  end
end