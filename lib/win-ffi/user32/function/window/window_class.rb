require 'win-ffi/user32'

require 'win-ffi/user32/enum/window/flag/get_class_long_flags'
require 'win-ffi/user32/enum/window/flag/get_window_long_flags'
require 'win-ffi/user32/enum/window/window_long'

require 'win-ffi/user32/struct/window_class/wndclass'
require 'win-ffi/user32/struct/window_class/wndclassex'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633578(v=vs.85).aspx
    # The GetClassInfo function has been superseded by the GetClassInfoEx function
    # BOOL WINAPI GetClassInfo(
    #   _In_opt_  HINSTANCE hInstance,
    #   _In_      LPCTSTR lpClassName,
    #   _Out_     LPWNDCLASS lpWndClass )
    encoded_function 'GetClassInfo', [:hinstance, :pointer, WNDCLASS.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633579(v=vs.85).aspx
    #BOOL WINAPI GetClassInfoEx(
    #  _In_opt_  HINSTANCE hinst,
    #  _In_      LPCTSTR lpszClass,
    #  _Out_     LPWNDCLASSEX lpwcx )
    encoded_function 'GetClassInfoEx', [:hinstance, :string, WNDCLASSEX.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633580(v=vs.85).aspx
    # DWORD WINAPI GetClassLong(
    #   __in  HWND hWnd,
    #   __in  int nIndex)
    encoded_function 'GetClassLong', [:hwnd, GetClassLongFlags], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633582(v=vs.85).aspx
    # int WINAPI GetClassName(
    #   _In_   HWND hWnd,
    #   _Out_  LPTSTR lpClassName,
    #   _In_   int nMaxCount )
    encoded_function 'GetClassName', [:hwnd, :string, :int], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633583(v=vs.85).aspx
    # WORD WINAPI GetClassWord(
    #   _In_  HWND hWnd,
    #   _In_  int nIndex )
    attach_function 'GetClassWord', [:hwnd, :int], :word

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633584(v=vs.85).aspx
    # LONG WINAPI GetWindowLong(
    #   __in  HWND hWnd,
    #   __in  int nIndex)
    encoded_function 'GetWindowLong', [:hwnd, GetWindowLongFlags], :long

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633583(v=vs.85).aspx
    # The function is provided only for compatibility with 16-bit versions of Windows
    # WORD GetWindowWord(
    #   _In_ HWND hWnd,
    #   _In_ int nIndex);
    attach_function 'GetWindowWord', [:hwnd, :int], :word

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633586(v=vs.85).aspx
    # ATOM WINAPI RegisterClass( _In_  const WNDCLASS *lpWndClass )
    encoded_function 'RegisterClass', [WNDCLASS.ptr], :atom

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633587(v=vs.85).aspx
    # ATOM RegisterClassEx( __in  const WNDCLASSEX *lpwcx )
    encoded_function 'RegisterClassEx', [WNDCLASSEX.ptr], :atom

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633588(v=vs.85).aspx
    # DWORD WINAPI SetClassLong(
    #   __in  HWND hWnd,
    #   __in  int nIndex,
    #   __in  LONG dwNewLong)
    encoded_function 'SetClassLong', [:hwnd, GetClassLongFlags, :long], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633590(v=vs.85).aspx
    # WORD WINAPI SetClassWord(
    #   _In_  HWND hWnd,
    #   _In_  int nIndex,
    #   _In_  WORD wNewWord )
    attach_function 'SetClassWord', [:hwnd, :int, :word], :word

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633591(v=vs.85).aspx
    # LONG WINAPI SetWindowLong(
    #   __in  HWND hWnd,
    #   __in  int nIndex,
    #   __in  LONG dwNewLong)
    encoded_function 'SetWindowLong', [:hwnd, GetWindowLongFlags, :long], :long

    # WORD SetWindowWord(
    #   _In_ HWND hWnd,
    #   _In_ int nIndex,
    #   _In_ WORD wNewWord);
    attach_function 'SetWindowWord', [:hwnd, :int, :word], :word

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644899(v=vs.85).aspx
    # BOOL UnregisterClass(
    #   __in      LPCTSTR   lpClassName,
    #   __in_opt  HINSTANCE hInstance)
    encoded_function 'UnregisterClass', [:pointer, :hinstance], :bool

    if Architecture == 64
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633581(v=vs.85).aspx
      # LONG_PTR WINAPI GetWindowLongPtr(
      #   __in  HWND hWnd,
      #   __in  int nIndex)
      encoded_function 'GetWindowLongPtr', [:hwnd, :int], :long

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633581(v=vs.85).aspx
      # ULONG_PTR WINAPI GetClassLongPtr(
      #   __in  HWND hWnd,
      #   __in  int nIndex)
      encoded_function 'GetClassLongPtr', [:hwnd, ClassLong], :ulong

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633589(v=vs.85).aspx
      # ULONG_PTR WINAPI SetClassLongPtr(
      #   _In_ HWND     hWnd,
      #   _In_ int      nIndex,
      #   _In_ LONG_PTR dwNewLong)
      attach_function 'SetClassLongPtr', [:hwnd, ClassLong, :long], :ulong

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644898(v=vs.85).aspx
      # LONG_PTR WINAPI SetWindowLongPtr(
      #   __in  HWND hWnd,
      #   __in  int nIndex,
      #   __in  LONG_PTR dwNewLong)
      encoded_function 'SetWindowLongPtr',  [:hwnd, GetWindowLongFlags, :long], :long
    end
  end
end