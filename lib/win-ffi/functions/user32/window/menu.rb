require_relative '../../../enums/user32/window/menu_flags'
require_relative '../../../enums/user32/append_menu_flags'
require_relative '../../../enums/user32/window/track_popup_menu_flags'

require_relative '../../../structs/user32/window/menubar_info'
require_relative '../../../structs/user32/window/menu_info'
require_relative '../../../structs/user32/window/menu_item_info'
require_relative '../../../structs/user32/window/menu_item_template'
require_relative '../../../structs/user32/window/tpm_params'

module WinFFI
  module User32
    #BOOL WINAPI AppendMenu(
    #  _In_      HMENU hMenu,
    #  _In_      UINT uFlags,
    #  _In_      UINT_PTR uIDNewItem,
    #  _In_opt_  LPCTSTR lpNewItem )
    attach_function 'AppendMenuA', [:hmenu, AppendMenuFlags, :uint, :pointer], :bool
    attach_function 'AppendMenuW', [:hmenu, AppendMenuFlags, :uint, :pointer], :bool

    #DWORD WINAPI CheckMenuItem(
    #  _In_  HMENU hmenu,
    #  _In_  UINT uIDCheckItem,
    #  _In_  UINT uCheck )
    attach_function 'CheckMenuItem', [:hmenu, :uint, :uint], :dword

    #BOOL WINAPI CheckMenuRadioItem(
    #  _In_  HMENU hmenu,
    #  _In_  UINT idFirst,
    #  _In_  UINT idLast,
    #  _In_  UINT idCheck,
    #  _In_  UINT uFlags )
    attach_function 'CheckMenuRadioItem', [:hmenu, :uint, :uint, :uint, :uint], :bool

    #HMENU WINAPI CreateMenu(void)
    attach_function 'CreateMenu', [], :hmenu

    #HMENU WINAPI CreatePopupMenu(void)
    attach_function 'CreatePopupMenu', [], :hmenu

    #BOOL WINAPI DeleteMenu(
    #  _In_  HMENU hMenu,
    #  _In_  UINT uPosition,
    #  _In_  UINT uFlags )
    attach_function 'DeleteMenu', [:hmenu, :uint, :uint], :bool

    #BOOL WINAPI DestroyMenu( _In_  HMENU hMenu )
    attach_function 'DestroyMenu', [:hmenu], :bool

    #BOOL WINAPI DrawMenuBar( _In_  HWND hWnd )
    attach_function 'DrawMenuBar', [:hwnd], :bool

    #BOOL WINAPI EnableMenuItem(
    #  _In_  HMENU hMenu,
    #  _In_  UINT uIDEnableItem,
    #  _In_  UINT uEnable )
    attach_function 'EnableMenuItem', [:hmenu, :uint, :uint], :bool

    #BOOL WINAPI EndMenu(void)
    attach_function 'EndMenu', [], :bool

    #HMENU WINAPI GetMenu( _In_  HWND hWnd )
    attach_function 'GetMenu', [:hwnd], :hmenu

    #BOOL WINAPI GetMenuBarInfo(
    #  _In_     HWND hwnd,
    #  _In_     LONG idObject,
    #  _In_     LONG idItem,
    #  _Inout_  PMENUBARINFO pmbi )
    attach_function 'GetMenuBarInfo', [:hwnd, :long, :long, MENUBARINFO.ptr], :bool

    #LONG WINAPI GetMenuCheckMarkDimensions(void)
    attach_function 'GetMenuCheckMarkDimensions', [], :long

    #UINT WINAPI GetMenuDefaultItem(
    #  _In_  HMENU hMenu,
    #  _In_  UINT fByPos,
    #  _In_  UINT gmdiFlags )
    attach_function 'GetMenuDefaultItem', [:hmenu, :uint, :uint], :uint

    #BOOL WINAPI GetMenuInfo(
    #  _In_     HMENU hmenu,
    #  _Inout_  LPMENUINFO lpcmi )
    attach_function 'GetMenuInfo', [:hmenu, MENUINFO.ptr], :bool

    #int WINAPI GetMenuItemCount( _In_opt_  HMENU hMenu )
    attach_function 'GetMenuItemCount', [:hmenu], :int

    #UINT WINAPI GetMenuItemID(
    #  _In_  HMENU hMenu,
    #  _In_  int nPos )
    attach_function 'GetMenuItemID', [:hmenu, :int], :uint

    #BOOL WINAPI GetMenuItemInfo(
    #  _In_     HMENU hMenu,
    #  _In_     UINT uItem,
    #  _In_     BOOL fByPosition,
    #  _Inout_  LPMENUITEMINFO lpmii )
    attach_function 'GetMenuItemInfoA', [:hmenu, :uint, :bool, MENUITEMINFO.ptr], :bool
    attach_function 'GetMenuItemInfoW', [:hmenu, :uint, :bool, MENUITEMINFO.ptr], :bool

    #BOOL WINAPI GetMenuItemRect(
    #  _In_opt_  HWND hWnd,
    #  _In_      HMENU hMenu,
    #  _In_      UINT uItem,
    #  _Out_     LPRECT lprcItem )
    attach_function 'GetMenuItemRect', [:hwnd, :hmenu, :uint, RECT.ptr], :bool

    #UINT WINAPI GetMenuState(
    #  _In_  HMENU hMenu,
    #  _In_  UINT uId,
    #  _In_  UINT uFlags )
    attach_function 'GetMenuState', [:hmenu, :uint, :uint], :uint

    #int WINAPI GetMenuString(
    #  _In_       HMENU hMenu,
    #  _In_       UINT uIDItem,
    #  _Out_opt_  LPTSTR lpString,
    #  _In_       int nMaxCount,
    #  _In_       UINT uFlag )
    attach_function 'GetMenuStringA', [:hmenu, :uint, :string, :int, :uint], :int
    attach_function 'GetMenuStringW', [:hmenu, :uint, :string, :int, :uint], :int

    #HMENU WINAPI GetSubMenu(
    #  _In_  HMENU hMenu,
    #  _In_  int nPos )
    attach_function 'GetSubMenu', [:hmenu, :int], :hmenu

    #HMENU WINAPI GetSystemMenu(
    #  _In_  HWND hWnd,
    #  _In_  BOOL bRevert )
    attach_function 'GetSystemMenu', [:hwnd, :bool], :hmenu

    #BOOL WINAPI HiliteMenuItem(
    #  _In_  HWND hwnd,
    #  _In_  HMENU hmenu,
    #  _In_  UINT uItemHilite,
    #  _In_  UINT uHilite )
    attach_function 'HiliteMenuItem', [:hwnd, :hmenu, :uint, :uint], :bool

    #BOOL WINAPI InsertMenu(
    #  _In_      HMENU hMenu,
    #  _In_      UINT uPosition,
    #  _In_      UINT uFlags,
    #  _In_      UINT_PTR uIDNewItem,
    #  _In_opt_  LPCTSTR lpNewItem )
    attach_function 'InsertMenuA', [:hmenu, :uint, MenuFlags, :ulong, :string], :bool
    attach_function 'InsertMenuW', [:hmenu, :uint, MenuFlags, :ulong, :string], :bool

    #BOOL WINAPI InsertMenuItem(
    #  _In_  HMENU hMenu,
    #  _In_  UINT uItem,
    #  _In_  BOOL fByPosition,
    #  _In_  LPCMENUITEMINFO lpmii )
    attach_function 'InsertMenuItemA', [:hmenu, :uint, :bool, MENUITEMINFO.ptr], :bool
    attach_function 'InsertMenuItemW', [:hmenu, :uint, :bool, MENUITEMINFO.ptr], :bool

    #BOOL WINAPI IsMenu( _In_  HMENU hMenu )
    attach_function 'IsMenu', [:hmenu], :bool

    #HMENU WINAPI LoadMenu(
    #  _In_opt_  HINSTANCE hInstance,
    #  _In_      LPCTSTR lpMenuName )
    attach_function 'LoadMenuA', [:hinstance, :string], :hmenu
    attach_function 'LoadMenuW', [:hinstance, :string], :hmenu

    #HMENU WINAPI LoadMenuIndirect( _In_  const MENUTEMPLATE *lpMenuTemplate )
    attach_function 'LoadMenuIndirectA', [MENUITEMTEMPLATE.ptr], :hmenu
    attach_function 'LoadMenuIndirectW', [MENUITEMTEMPLATE.ptr], :hmenu

    #int WINAPI MenuItemFromPoint(
    #  _In_opt_  HWND hWnd,
    #  _In_      HMENU hMenu,
    #  _In_      POINT ptScreen )
    attach_function 'MenuItemFromPoint', [:hwnd, :hmenu, POINT], :int

    #BOOL WINAPI ModifyMenu(
    #  _In_      HMENU hMnu,
    #  _In_      UINT uPosition,
    #  _In_      UINT uFlags,
    #  _In_      UINT_PTR uIDNewItem,
    #  _In_opt_  LPCTSTR lpNewItem )
    attach_function 'ModifyMenuA', [:hmenu, :uint, MenuFlags, :uint, :string], :bool
    attach_function 'ModifyMenuW', [:hmenu, :uint, MenuFlags, :uint, :string], :bool

    #BOOL WINAPI RemoveMenu(
    #  _In_  HMENU hMenu,
    #  _In_  UINT uPosition,
    #  _In_  UINT uFlags )
    attach_function 'RemoveMenu', [:hmenu, :uint, :uint], :bool

    #BOOL WINAPI SetMenu(
    #  _In_      HWND hWnd,
    #  _In_opt_  HMENU hMenu )
    attach_function 'SetMenu', [:hwnd, :hmenu], :bool

    #BOOL WINAPI SetMenuDefaultItem(
    #  _In_  HMENU hMenu,
    #  _In_  UINT uItem,
    #  _In_  UINT fByPos )
    attach_function 'SetMenuDefaultItem', [:hmenu, :uint, :uint], :bool

    #BOOL WINAPI SetMenuInfo(
    #  _In_  HMENU hmenu,
    #  _In_  LPCMENUINFO lpcmi )
    attach_function 'SetMenuInfo', [:hmenu, MENUINFO.ptr], :bool

    #BOOL WINAPI SetMenuItemBitmaps(
    #  _In_      HMENU hMenu,
    #  _In_      UINT uPosition,
    #  _In_      UINT uFlags,
    #  _In_opt_  HBITMAP hBitmapUnchecked,
    #  _In_opt_  HBITMAP hBitmapChecked )
    attach_function 'SetMenuItemBitmaps', [:hmenu, :uint, MenuFlags, :hbitmap, :hbitmap], :bool

    #BOOL WINAPI SetMenuItemInfo(
    #  _In_  HMENU hMenu,
    #  _In_  UINT uItem,
    #  _In_  BOOL fByPosition,
    #  _In_  LPMENUITEMINFO lpmii )
    attach_function 'SetMenuItemInfoA', [:hmenu, :uint, :bool, MENUITEMINFO.ptr], :bool
    attach_function 'SetMenuItemInfoW', [:hmenu, :uint, :bool, MENUITEMINFO.ptr], :bool

    #BOOL WINAPI TrackPopupMenu(
    #  _In_      HMENU hMenu,
    #  _In_      UINT uFlags,
    #  _In_      int x,
    #  _In_      int y,
    #  _In_      int nReserved,
    #  _In_      HWND hWnd,
    #  _In_opt_  const RECT *prcRect )
    attach_function 'TrackPopupMenu', [:hmenu, TrackPopupMenuFlags, :int, :int, :int, :hwnd, RECT.ptr], :bool

    #BOOL WINAPI TrackPopupMenuEx(
    #  _In_      HMENU hmenu,
    #  _In_      UINT fuFlags,
    #  _In_      int x,
    #  _In_      int y,
    #  _In_      HWND hwnd,
    #  _In_opt_  LPTPMPARAMS lptpm )
    attach_function 'TrackPopupMenuEx', [:hmenu, TrackPopupMenuFlags, :int, :int, :hwnd, TPMPARAMS.ptr], :bool
  end
end