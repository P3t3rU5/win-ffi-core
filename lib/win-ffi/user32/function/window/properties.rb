require 'win-ffi/user32'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633565(v=vs.85).aspx
    # BOOL CALLBACK PropEnumProc(
    #   _In_  HWND hwnd,
    #   _In_  LPCTSTR lpszString,
    #   _In_  HANDLE hData )
    PropEnumProc = callback 'PropEnumProc', [:hwnd, :string, :handle], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633566(v=vs.85).aspx
    # BOOL CALLBACK PropEnumProcEx(
    #   _In_  HWND hwnd,
    #   _In_  LPTSTR lpszString,
    #   _In_  HANDLE hData,
    #   _In_  ULONG_PTR dwData )
    PropEnumProcEx = callback 'PropEnumProcEx', [:hwnd, :string, :handle, :ulong], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633562(v=vs.85).aspx
    # int WINAPI EnumProps(
    #   _In_  HWND hWnd,
    #   _In_  PROPENUMPROC lpEnumFunc )
    encoded_function 'EnumProps', [:hwnd, PropEnumProc], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633563(v=vs.85).aspx
    # int WINAPI EnumPropsEx(
    #   _In_  HWND hWnd,
    #   _In_  PROPENUMPROCEX lpEnumFunc,
    #   _In_  LPARAM lParam )
    encoded_function 'EnumPropsEx', [:hwnd, PropEnumProcEx, :lparam], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633564(v=vs.85).aspx
    # HANDLE WINAPI GetProp(
    #   _In_  HWND hWnd,
    #   _In_  LPCTSTR lpString )
    encoded_function 'GetProp', [:hwnd, :string], :handle

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633567(v=vs.85).aspx
    # HANDLE WINAPI RemoveProp(
    #   _In_  HWND hWnd,
    #   _In_  LPCTSTR lpString )
    encoded_function 'RemoveProp', [:hwnd, :string], :handle

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633568(v=vs.85).aspx
    # BOOL WINAPI SetProp(
    #   _In_      HWND hWnd,
    #   _In_      LPCTSTR lpString,
    #   _In_opt_  HANDLE hData )
    encoded_function 'SetProp', [:hwnd, :string, :handle], :bool
  end
end