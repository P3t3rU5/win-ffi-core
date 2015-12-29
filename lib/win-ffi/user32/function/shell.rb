require 'win-ffi/user32'

module WinFFI
  module User32
    #DWORD GetMenuContextHelpId( HMENU hmenu )
    attach_function 'GetMenuContextHelpId', [:hmenu], :dword

    #DWORD GetWindowContextHelpId( HWND hwnd )
    attach_function 'GetWindowContextHelpId', [:hwnd], :dword

    #BOOL SetMenuContextHelpId(
    #  HMENU hmenu,
    #  DWORD dwContextHelpId )
    attach_function 'SetMenuContextHelpId', [:hmenu, :dword], :bool

    #BOOL SetWindowContextHelpId(
    #  HWND hwnd,
    #  DWORD dwContextHelpId )
    attach_function 'SetWindowContextHelpId', [:hwnd, :dword], :bool

    #BOOL WinHelp(
    #  HWND hWndMain,
    #  LPCTSTR lpszHelp,
    #  UINT uCommand,
    #  ULONG_PTR dwData )
    encoded_function 'WinHelp', [:hwnd, :string, :uint, :ulong], :bool
  end
end