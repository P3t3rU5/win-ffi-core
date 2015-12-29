require 'win-ffi/user32'

require 'win-ffi/user32/enum/window/get_class_long_flags'
require 'win-ffi/user32/enum/window/window_long'
require 'win-ffi/user32/enum/window/get_window_long_flags'

require 'win-ffi/user32/struct/window/wndclass'
require 'win-ffi/user32/struct/window/wndclassex'

module WinFFI
  module User32
    #BOOL WINAPI GetClassInfo(
    #  _In_opt_  HINSTANCE hInstance,
    #  _In_      LPCTSTR lpClassName,
    #  _Out_     LPWNDCLASS lpWndClass )
    encoded_function 'GetClassInfo', [:hinstance, :pointer, WNDCLASS.ptr], :bool

    #BOOL WINAPI GetClassInfoEx(
    #  _In_opt_  HINSTANCE hinst,
    #  _In_      LPCTSTR lpszClass,
    #  _Out_     LPWNDCLASSEX lpwcx )
    encoded_function 'GetClassInfoEx', [:hinstance, :pointer, WNDCLASSEX.ptr], :bool

    #DWORD WINAPI GetClassLong(
    #  __in  HWND hWnd,
    #  __in  int nIndex)
    encoded_function 'GetClassLong', [:hwnd, GetClassLongFlags], :dword

    #int WINAPI GetClassName(
    #  _In_   HWND hWnd,
    #  _Out_  LPTSTR lpClassName,
    #  _In_   int nMaxCount )
    encoded_function 'GetClassName', [:hwnd, :string, :int], :int

    # WORD GetWindowWord(
    # _In_ HWND hWnd,
    # _In_ int nIndex);
    attach_function 'GetWindowWord', [:hwnd, :int], :word

    # WORD SetWindowWord(
    # _In_ HWND hWnd,
    # _In_ int nIndex,
    # _In_ WORD wNewWord);
    attach_function 'SetWindowWord', [:hwnd, :int, :word], :word

    #WORD WINAPI GetClassWord(
    #  _In_  HWND hWnd,
    #  _In_  int nIndex )
    attach_function 'GetClassWord', [:hwnd, :int], :word

    #LONG WINAPI GetWindowLong(
    #  __in  HWND hWnd,
    #  __in  int nIndex)
    encoded_function 'GetWindowLong', [:hwnd, GetWindowLongFlags], :long

    #ATOM WINAPI RegisterClass( _In_  const WNDCLASS *lpWndClass )
    encoded_function 'RegisterClass', [WNDCLASS.ptr], :atom

    #ATOM RegisterClassEx( __in  const WNDCLASSEX *lpwcx )
    encoded_function 'RegisterClassEx', [:pointer], :atom

    #DWORD WINAPI SetClassLong(
    #  __in  HWND hWnd,
    #  __in  int nIndex,
    #  __in  LONG dwNewLong)
    encoded_function 'SetClassLong', [:hwnd, GetClassLongFlags, :long], :dword

    #WORD WINAPI SetClassWord(
    #  _In_  HWND hWnd,
    #  _In_  int nIndex,
    #  _In_  WORD wNewWord )
    attach_function 'SetClassWord', [:hwnd, :int, :word], :word

    #LONG WINAPI SetWindowLong(
    #  __in  HWND hWnd,
    #  __in  int nIndex,
    #  __in  LONG dwNewLong)
    encoded_function 'SetWindowLong', [:hwnd, GetWindowLongFlags, :long], :long

    #BOOL UnregisterClass(
    #  __in      LPCTSTR   lpClassName,
    #  __in_opt  HINSTANCE hInstance)
    encoded_function 'UnregisterClass', [:pointer, :hinstance], :bool

    if Architecture == 64
      #LONG_PTR WINAPI GetWindowLongPtr(
      #  __in  HWND hWnd,
      #  __in  int nIndex)
      encoded_function 'GetWindowLongPtr', [:hwnd, :int], :long

      #LONG_PTR WINAPI SetWindowLongPtr(
      #  __in  HWND hWnd,
      #  __in  int nIndex,
      #  __in  LONG_PTR dwNewLong)
      encoded_function 'SetWindowLongPtr',  [:hwnd, GetWindowLongFlags, :long], :long

      #ULONG_PTR WINAPI GetClassLongPtr(
      #  __in  HWND hWnd,
      #  __in  int nIndex)
      encoded_function 'GetClassLongPtr', [:hwnd, ClassLong], :ulong

      # ULONG_PTR WINAPI SetClassLongPtr(
      # _In_ HWND     hWnd,
      # _In_ int      nIndex,
      # _In_ LONG_PTR dwNewLong)
      attach_function 'SetClassLongPtr', [:hwnd, ClassLong, :long], :ulong

    end
  end
end