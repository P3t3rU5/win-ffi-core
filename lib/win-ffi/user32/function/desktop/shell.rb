require 'win-ffi/user32'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/bb776428(v=vs.85).aspx
    # DWORD GetMenuContextHelpId( HMENU hmenu )
    attach_function 'GetMenuContextHelpId', [:hmenu], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/bb776429(v=vs.85).aspx
    # DWORD GetWindowContextHelpId( HWND hwnd )
    attach_function 'GetWindowContextHelpId', [:hwnd], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/bb762099(v=vs.85).aspx
    # BOOL SetMenuContextHelpId(
    #   HMENU hmenu,
    #   DWORD dwContextHelpId )
    attach_function 'SetMenuContextHelpId', [:hmenu, :dword], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/bb762101(v=vs.85).aspx
    # BOOL SetWindowContextHelpId(
    #   HWND hwnd,
    #   DWORD dwContextHelpId )
    attach_function 'SetWindowContextHelpId', [:hwnd, :dword], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/bb762267(v=vs.85).aspx
    # BOOL WinHelp(
    #   HWND hWndMain,
    #   LPCTSTR lpszHelp,
    #   UINT uCommand,
    #   ULONG_PTR dwData )
    encoded_function 'WinHelp', [:hwnd, :string, :uint, :ulong], :bool
  end
end