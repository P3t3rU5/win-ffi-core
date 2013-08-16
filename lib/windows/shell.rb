module WinFFI
  module Shell
    extend LibBase

    ffi_lib 'user32'

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
    attach_function 'WinHelpA', [:hwnd, :string, :uint, :ulong], :bool
    attach_function 'WinHelpW', [:hwnd, :string, :uint, :ulong], :bool

  end
end