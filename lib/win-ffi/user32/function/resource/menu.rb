require 'win-ffi/user32'

require 'win-ffi/user32/enum/resource/menu/menu_flag'
require 'win-ffi/user32/enum/resource/menu/append_menu_flag'
require 'win-ffi/user32/enum/resource/menu/track_popup_menu_flag'
require 'win-ffi/user32/enum/resource/menu/get_menu_default_item_flag'

require 'win-ffi/general/struct/point'
require 'win-ffi/user32/struct/resource/menu/menubar_info'
require 'win-ffi/user32/struct/resource/menu/menu_info'
require 'win-ffi/user32/struct/resource/menu/menu_item_info'
require 'win-ffi/user32/struct/resource/menu/menu_item_template'
require 'win-ffi/user32/struct/resource/menu/tpm_params'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647616(v=vs.85).aspx
    # BOOL WINAPI AppendMenu(
    #   _In_      HMENU hMenu,
    #   _In_      UINT uFlags,
    #   _In_      UINT_PTR uIDNewItem,
    #   _In_opt_  LPCTSTR lpNewItem )
    encoded_function 'AppendMenu', [:hmenu, AppendMenuFlag, :uint, :pointer], :bool

    # Deprecated
    # http://winapi.freetechsecrets.com/win32/WIN32ChangeMenu.htm
    # BOOL ChangeMenuA(
    #   _In_ HMENU hMenu,
    #   _In_ UINT cmd,
    #   _In_opt_ LPCSTR lpszNewItem,
    #   _In_ UINT cmdInsert,
    #   _In_ UINT flags)
    encoded_function 'ChangeMenu', [:hmenu, :uint, :string, :uint, :uint], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647619(v=vs.85).aspx
    # DWORD WINAPI CheckMenuItem(
    #   _In_  HMENU hmenu,
    #   _In_  UINT uIDCheckItem,
    #   _In_  UINT uCheck )
    attach_function 'CheckMenuItem', [:hmenu, :uint, :uint], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647621(v=vs.85).aspx
    # BOOL WINAPI CheckMenuRadioItem(
    #   _In_  HMENU hmenu,
    #   _In_  UINT idFirst,
    #   _In_  UINT idLast,
    #   _In_  UINT idCheck,
    #   _In_  UINT uFlags )
    attach_function 'CheckMenuRadioItem', [:hmenu, :uint, :uint, :uint, :uint], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647624(v=vs.85).aspx
    # HMENU WINAPI CreateMenu(void)
    attach_function 'CreateMenu', [], :hmenu

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647626(v=vs.85).aspx
    # HMENU WINAPI CreatePopupMenu(void)
    attach_function 'CreatePopupMenu', [], :hmenu

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647629(v=vs.85).aspx
    # BOOL WINAPI DeleteMenu(
    #   _In_  HMENU hMenu,
    #   _In_  UINT uPosition,
    #   _In_  UINT uFlags )
    attach_function 'DeleteMenu', [:hmenu, :uint, :uint], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647631(v=vs.85).aspx
    # BOOL WINAPI DestroyMenu( _In_  HMENU hMenu )
    attach_function 'DestroyMenu', [:hmenu], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647633(v=vs.85).aspx
    # BOOL WINAPI DrawMenuBar( _In_  HWND hWnd )
    attach_function 'DrawMenuBar', [:hwnd], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647636(v=vs.85).aspx
    # BOOL WINAPI EnableMenuItem(
    #   _In_  HMENU hMenu,
    #   _In_  UINT uIDEnableItem,
    #   _In_  UINT uEnable )
    attach_function 'EnableMenuItem', [:hmenu, :uint, :uint], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647637(v=vs.85).aspx
    # BOOL WINAPI EndMenu(void)
    attach_function 'EndMenu', [], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647640(v=vs.85).aspx
    # HMENU WINAPI GetMenu( _In_  HWND hWnd )
    attach_function 'GetMenu', [:hwnd], :hmenu

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647833(v=vs.85).aspx
    # BOOL WINAPI GetMenuBarInfo(
    #   _In_     HWND hwnd,
    #   _In_     LONG idObject,
    #   _In_     LONG idItem,
    #   _Inout_  PMENUBARINFO pmbi )
    attach_function 'GetMenuBarInfo', [:hwnd, :long, :long, MENUBARINFO.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647975(v=vs.85).aspx
    # LONG WINAPI GetMenuCheckMarkDimensions(void)
    attach_function 'GetMenuCheckMarkDimensions', [], :long

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647976(v=vs.85).aspx
    # UINT WINAPI GetMenuDefaultItem(
    #   _In_  HMENU hMenu,
    #   _In_  UINT fByPos,
    #   _In_  UINT gmdiFlags )
    attach_function 'GetMenuDefaultItem', [:hmenu, :uint, GetMenuDefaultItemFlag], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647977(v=vs.85).aspx
    # BOOL WINAPI GetMenuInfo(
    #   _In_     HMENU hmenu,
    #   _Inout_  LPMENUINFO lpcmi )
    attach_function 'GetMenuInfo', [:hmenu, MENUINFO.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647978(v=vs.85).aspx
    # int WINAPI GetMenuItemCount( _In_opt_  HMENU hMenu )
    attach_function 'GetMenuItemCount', [:hmenu], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647979(v=vs.85).aspx
    # UINT WINAPI GetMenuItemID(
    #   _In_  HMENU hMenu,
    #   _In_  int nPos )
    attach_function 'GetMenuItemID', [:hmenu, :int], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647980(v=vs.85).aspx
    # BOOL WINAPI GetMenuItemInfo(
    #   _In_     HMENU hMenu,
    #   _In_     UINT uItem,
    #   _In_     BOOL fByPosition,
    #   _Inout_  LPMENUITEMINFO lpmii )
    encoded_function 'GetMenuItemInfo', [:hmenu, :uint, :bool, MENUITEMINFO.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647981(v=vs.85).aspx
    # BOOL WINAPI GetMenuItemRect(
    #   _In_opt_  HWND hWnd,
    #   _In_      HMENU hMenu,
    #   _In_      UINT uItem,
    #   _Out_     LPRECT lprcItem )
    attach_function 'GetMenuItemRect', [:hwnd, :hmenu, :uint, RECT.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647982(v=vs.85).aspx
    # UINT WINAPI GetMenuState(
    #   _In_  HMENU hMenu,
    #   _In_  UINT uId,
    #   _In_  UINT uFlags )
    attach_function 'GetMenuState', [:hmenu, :uint, :uint], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647983(v=vs.85).aspx
    # int WINAPI GetMenuString(
    #   _In_       HMENU hMenu,
    #   _In_       UINT uIDItem,
    #   _Out_opt_  LPTSTR lpString,
    #   _In_       int nMaxCount,
    #   _In_       UINT uFlag )
    encoded_function 'GetMenuString', [:hmenu, :uint, :string, :int, :uint], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647984(v=vs.85).aspx
    # HMENU WINAPI GetSubMenu(
    #   _In_  HMENU hMenu,
    #   _In_  int nPos )
    attach_function 'GetSubMenu', [:hmenu, :int], :hmenu

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647985(v=vs.85).aspx
    # HMENU WINAPI GetSystemMenu(
    #   _In_  HWND hWnd,
    #   _In_  BOOL bRevert )
    attach_function 'GetSystemMenu', [:hwnd, :bool], :hmenu

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647986(v=vs.85).aspx
    # BOOL WINAPI HiliteMenuItem(
    #   _In_  HWND hwnd,
    #   _In_  HMENU hmenu,
    #   _In_  UINT uItemHilite,
    #   _In_  UINT uHilite )
    attach_function 'HiliteMenuItem', [:hwnd, :hmenu, :uint, :uint], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647987(v=vs.85).aspx
    # The InsertMenu function has been superseded by the InsertMenuItem function.
    # BOOL WINAPI InsertMenu(
    #   _In_      HMENU hMenu,
    #   _In_      UINT uPosition,
    #   _In_      UINT uFlags,
    #   _In_      UINT_PTR uIDNewItem,
    #   _In_opt_  LPCTSTR lpNewItem )
    encoded_function 'InsertMenu', [:hmenu, :uint, MenuFlag, :ulong, MenuFlag], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647988(v=vs.85).aspx
    # BOOL WINAPI InsertMenuItem(
    #   _In_  HMENU hMenu,
    #   _In_  UINT uItem,
    #   _In_  BOOL fByPosition,
    #   _In_  LPCMENUITEMINFO lpmii )
    encoded_function 'InsertMenuItem', [:hmenu, :uint, :bool, MENUITEMINFO.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647989(v=vs.85).aspx
    # BOOL WINAPI IsMenu( _In_  HMENU hMenu )
    attach_function 'IsMenu', [:hmenu], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647990(v=vs.85).aspx
    # HMENU WINAPI LoadMenu(
    #   _In_opt_  HINSTANCE hInstance,
    #   _In_      LPCTSTR lpMenuName )
    encoded_function 'LoadMenu', [:hinstance, :string], :hmenu

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647991(v=vs.85).aspx
    # HMENU WINAPI LoadMenuIndirect( _In_  const MENUTEMPLATE *lpMenuTemplate )
    encoded_function 'LoadMenuIndirect', [MENUITEMTEMPLATE.ptr], :hmenu

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647992(v=vs.85).aspx
    # int WINAPI MenuItemFromPoint(
    #   _In_opt_  HWND hWnd,
    #   _In_      HMENU hMenu,
    #   _In_      POINT ptScreen )
    attach_function 'MenuItemFromPoint', [:hwnd, :hmenu, POINT], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647993(v=vs.85).aspx
    # The ModifyMenu function has been superseded by the SetMenuItemInfo function
    # BOOL WINAPI ModifyMenu(
    #   _In_      HMENU hMnu,
    #   _In_      UINT uPosition,
    #   _In_      UINT uFlags,
    #   _In_      UINT_PTR uIDNewItem,
    #   _In_opt_  LPCTSTR lpNewItem )
    encoded_function 'ModifyMenu', [:hmenu, :uint, MenuFlag, :uint, :string], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647994(v=vs.85).aspx
    # BOOL WINAPI RemoveMenu(
    #   _In_  HMENU hMenu,
    #   _In_  UINT uPosition,
    #   _In_  UINT uFlags )
    attach_function 'RemoveMenu', [:hmenu, :uint, :uint], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647995(v=vs.85).aspx
    # BOOL WINAPI SetMenu(
    #   _In_      HWND hWnd,
    #   _In_opt_  HMENU hMenu )
    attach_function 'SetMenu', [:hwnd, :hmenu], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647996(v=vs.85).aspx
    # BOOL WINAPI SetMenuDefaultItem(
    #   _In_  HMENU hMenu,
    #   _In_  UINT uItem,
    #   _In_  UINT fByPos )
    attach_function 'SetMenuDefaultItem', [:hmenu, :uint, :uint], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647997(v=vs.85).aspx
    # BOOL WINAPI SetMenuInfo(
    #   _In_  HMENU hmenu,
    #   _In_  LPCMENUINFO lpcmi )
    attach_function 'SetMenuInfo', [:hmenu, MENUINFO.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647998(v=vs.85).aspx
    # BOOL WINAPI SetMenuItemBitmaps(
    #   _In_      HMENU hMenu,
    #   _In_      UINT uPosition,
    #   _In_      UINT uFlags,
    #   _In_opt_  HBITMAP hBitmapUnchecked,
    #   _In_opt_  HBITMAP hBitmapChecked )
    attach_function 'SetMenuItemBitmaps', [:hmenu, :uint, MenuFlag, :hbitmap, :hbitmap], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648001(v=vs.85).aspx
    # BOOL WINAPI SetMenuItemInfo(
    #   _In_  HMENU hMenu,
    #   _In_  UINT uItem,
    #   _In_  BOOL fByPosition,
    #   _In_  LPMENUITEMINFO lpmii )
    encoded_function 'SetMenuItemInfo', [:hmenu, :uint, :bool, MENUITEMINFO.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648002(v=vs.85).aspx
    # BOOL WINAPI TrackPopupMenu(
    #   _In_      HMENU hMenu,
    #   _In_      UINT uFlags,
    #   _In_      int x,
    #   _In_      int y,
    #   _In_      int nReserved,
    #   _In_      HWND hWnd,
    #   _In_opt_  const RECT *prcRect )
    attach_function 'TrackPopupMenu', [:hmenu, TrackPopupMenuFlag, :int, :int, :int, :hwnd, RECT.ptr], :bool

    # BOOL WINAPI TrackPopupMenuEx(
    #   _In_      HMENU hmenu,
    #   _In_      UINT fuFlags,
    #   _In_      int x,
    #   _In_      int y,
    #   _In_      HWND hwnd,
    #   _In_opt_  LPTPMPARAMS lptpm )
    attach_function 'TrackPopupMenuEx', [:hmenu, TrackPopupMenuFlag, :int, :int, :hwnd, TPMPARAMS.ptr], :bool
  end
end