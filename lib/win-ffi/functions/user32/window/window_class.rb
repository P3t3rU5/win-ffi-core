require_relative '../../../enums/user32/window/get_class_long_flags'
require_relative '../../../enums/user32/window/window_long'
require_relative '../../../enums/user32/window/get_window_long_flags'

require_relative '../../../structs/user32/window/wndclass'
require_relative '../../../structs/user32/window/wndclassex'

module WinFFI
  module User32
    #BOOL WINAPI GetClassInfo(
    #  _In_opt_  HINSTANCE hInstance,
    #  _In_      LPCTSTR lpClassName,
    #  _Out_     LPWNDCLASS lpWndClass )
    attach_function 'GetClassInfoA', [:hinstance, :pointer, WNDCLASS.ptr], :bool
    attach_function 'GetClassInfoW', [:hinstance, :pointer, WNDCLASS.ptr], :bool

    #BOOL WINAPI GetClassInfoEx(
    #  _In_opt_  HINSTANCE hinst,
    #  _In_      LPCTSTR lpszClass,
    #  _Out_     LPWNDCLASSEX lpwcx )
    attach_function 'GetClassInfoExA', [:hinstance, :pointer, WNDCLASSEX.ptr], :bool
    attach_function 'GetClassInfoExW', [:hinstance, :pointer, WNDCLASSEX.ptr], :bool

    #DWORD WINAPI GetClassLong(
    #  __in  HWND hWnd,
    #  __in  int nIndex)
    attach_function 'GetClassLongA', [:hwnd, GetClassLongFlags], :dword
    attach_function 'GetClassLongW', [:hwnd, GetClassLongFlags], :dword

    #ULONG_PTR WINAPI GetClassLongPtr(
    #  __in  HWND hWnd,
    #  __in  int nIndex)
    #attach_function 'GetClassLongPtrA', [:hwnd, ClassLong], :ulong
    #attach_function 'GetClassLongPtrW', [:hwnd, ClassLong], :ulong

    #int WINAPI GetClassName(
    #  _In_   HWND hWnd,
    #  _Out_  LPTSTR lpClassName,
    #  _In_   int nMaxCount )
    attach_function 'GetClassNameA', [:hwnd, :string, :int], :int
    attach_function 'GetClassNameW', [:hwnd, :string, :int], :int

    #WORD WINAPI GetClassWord(
    #  _In_  HWND hWnd,
    #  _In_  int nIndex )
    attach_function 'GetClassWord', [:hwnd, :int], :word

    #LONG WINAPI GetWindowLong(
    #  __in  HWND hWnd,
    #  __in  int nIndex)
    attach_function 'GetWindowLongA', [:hwnd, GetWindowLongFlags], :long
    attach_function 'GetWindowLongW', [:hwnd, GetWindowLongFlags], :long

    #ATOM WINAPI RegisterClass( _In_  const WNDCLASS *lpWndClass )
    attach_function 'RegisterClassA', [WNDCLASS.ptr], :atom
    attach_function 'RegisterClassW', [WNDCLASS.ptr], :atom

    #ATOM RegisterClassEx( __in  const WNDCLASSEX *lpwcx )
    attach_function 'RegisterClassExA', [:pointer], :atom
    attach_function 'RegisterClassExW', [:pointer], :atom

    #DWORD WINAPI SetClassLong(
    #  __in  HWND hWnd,
    #  __in  int nIndex,
    #  __in  LONG dwNewLong)
    attach_function 'SetClassLongA', [:hwnd, GetClassLongFlags, :long], :dword
    attach_function 'SetClassLongW', [:hwnd, GetClassLongFlags, :long], :dword

    #WORD WINAPI SetClassWord(
    #  _In_  HWND hWnd,
    #  _In_  int nIndex,
    #  _In_  WORD wNewWord )
    attach_function 'SetClassWord', [:hwnd, :int, :word], :word

    #LONG WINAPI SetWindowLong(
    #  __in  HWND hWnd,
    #  __in  int nIndex,
    #  __in  LONG dwNewLong)
    attach_function 'SetWindowLongA', [:hwnd, GetWindowLongFlags, :long], :long
    attach_function 'SetWindowLongW', [:hwnd, GetWindowLongFlags, :long], :long

    #BOOL UnregisterClass(
    #  __in      LPCTSTR   lpClassName,
    #  __in_opt  HINSTANCE hInstance)
    attach_function 'UnregisterClassA', [:pointer, :hinstance], :bool
    attach_function 'UnregisterClassW', [:pointer, :hinstance], :bool

    begin
      #LONG_PTR WINAPI GetWindowLongPtr(
      #  __in  HWND hWnd,
      #  __in  int nIndex)
      attach_function 'GetWindowLongPtr',  [:hwnd, :int], :pointer
      attach_function 'GetWindowLongPtrA', [:hwnd, :int], :pointer
      attach_function 'GetWindowLongPtrW', [:hwnd, :int], :pointer

      #LONG_PTR WINAPI SetWindowLongPtr(
      #  __in  HWND hWnd,
      #  __in  int nIndex,
      #  __in  LONG_PTR dwNewLong)
      attach_function 'SetWindowLongPtr',  [:hwnd, GetWindowLongFlags, :pointer], :pointer
      attach_function 'SetWindowLongPtrA', [:hwnd, GetWindowLongFlags, :pointer], :pointer
      attach_function 'SetWindowLongPtrW', [:hwnd, GetWindowLongFlags, :pointer], :pointer
    rescue FFI::NotFoundError
      # In 32-bit Windows, these methods are aliases for GetWindowLong and SetWindowLong
    end
  end
end