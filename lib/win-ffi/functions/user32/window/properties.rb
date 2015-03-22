module WinFFI
  module User32
    #int WINAPI EnumProps(
    #  _In_  HWND hWnd,
    #  _In_  PROPENUMPROC lpEnumFunc )
    attach_function 'EnumPropsA', [:hwnd, :pointer], :int
    attach_function 'EnumPropsW', [:hwnd, :pointer], :int

    #int WINAPI EnumPropsEx(
    #  _In_  HWND hWnd,
    #  _In_  PROPENUMPROCEX lpEnumFunc,
    #  _In_  LPARAM lParam )
    attach_function 'EnumPropsExA', [:hwnd, :pointer, :lparam], :int
    attach_function 'EnumPropsExW', [:hwnd, :pointer, :lparam], :int

    #HANDLE WINAPI GetProp(
    #  _In_  HWND hWnd,
    #  _In_  LPCTSTR lpString )
    attach_function 'GetPropA', [:hwnd, :string], :handle
    attach_function 'GetPropW', [:hwnd, :string], :handle

    #BOOL CALLBACK PropEnumProc(
    #  _In_  HWND hwnd,
    #  _In_  LPCTSTR lpszString,
    #  _In_  HANDLE hData )
    callback 'PropEnumProc', [:hwnd, :string, :handle], :bool

    #BOOL CALLBACK PropEnumProcEx(
    #  _In_  HWND hwnd,
    #  _In_  LPTSTR lpszString,
    #  _In_  HANDLE hData,
    #  _In_  ULONG_PTR dwData )
    callback 'PropEnumProcEx', [:hwnd, :string, :handle, :ulong], :bool

    #HANDLE WINAPI RemoveProp(
    #  _In_  HWND hWnd,
    #  _In_  LPCTSTR lpString )
    attach_function 'RemovePropA', [:hwnd, :string], :handle
    attach_function 'RemovePropW', [:hwnd, :string], :handle

    #BOOL WINAPI SetProp(
    #  _In_      HWND hWnd,
    #  _In_      LPCTSTR lpString,
    #  _In_opt_  HANDLE hData )
    attach_function 'SetPropA', [:hwnd, :string, :handle], :bool
    attach_function 'SetPropW', [:hwnd, :string, :handle], :bool
  end
end