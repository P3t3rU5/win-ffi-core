module WinFFI
  module User32
    module Window
      module Menu
        extend LibBase

        ffi_lib 'user32'

        AppendMenuFlags = enum :append_menu_flags, [
            :BITMAP, 0x00000004, # Uses a bitmap as the menu item. The lpNewItem parameter contains a handle to the bitmap.

            :CHECKED, 0x00000008, #Places a check mark next to the menu item. If the application provides check-mark bitmaps
            # (see SetMenuItemBitmaps, this flag displays the check-mark bitmap next to the menu item.

            :DISABLED, 0x00000002, # Disables the menu item so that it cannot be selected, but the flag does not gray it.

            :ENABLED, 0x00000000, # Enables the menu item so that it can be selected, and restores it from its grayed state.

            :GRAYED, 0x00000001, # Disables the menu item and grays it so that it cannot be selected.

            :MENUBARBREAK, 0x00000020, # Functions the same as the :MENUBREAK flag for a menu bar. For a drop-down menu,
            # submenu, or shortcut menu, the new column is separated from the old column by a vertical line.

            :MENUBREAK, 0x00000040, # Places the item on a new line (for a menu bar) or in a new column (for a drop-down
            # menu, submenu, or shortcut menu) without separating columns.

            :OWNERDRAW, 0x00000100, #Specifies that the item is an owner-drawn item. Before the menu is displayed for the
            # first time, the window that owns the menu receives a WM_MEASUREITEM message to retrieve the width and height
            # of the menu item. The WM_DRAWITEM message is then sent to the window procedure of the owner window whenever
            # the appearance of the menu item must be updated.

            :POPUP, 0x00000010, # Specifies that the menu item opens a drop-down menu or submenu. The uIDNewItem parameter
            # specifies a handle to the drop-down menu or submenu. This flag is used to add a menu name to a menu bar, or a
            # menu item that opens a submenu to a drop-down menu, submenu, or shortcut menu.
            :SEPARATOR, 0x00000800, # Draws a horizontal dividing line. This flag is used only in a drop-down menu, submenu,
            # or shortcut menu. The line cannot be grayed, disabled, or highlighted. The lpNewItem and uIDNewItem parameters
            # are ignored.
            :STRING, 0x00000000, # Specifies that the menu item is a text string; the lpNewItem parameter is a pointer to
            # the string.
            :UNCHECKED, 0x00000000, # Does not place a check mark next to the item (default). If the application supplies
            # check-mark bitmaps (see SetMenuItemBitmaps), this flag displays the clear bitmap next to the menu item.
        ]

        MenuFlags = enum :menu_flags, [
            :BYCOMMAND, 0x00000000, # Indicates that the uPosition parameter gives the identifier of the menu item. The
            # :BYCOMMAND flag is the default if neither the :BYCOMMAND nor :BYPOSITION flag is specified.

            :ENABLED, 0x00000000, # Enables the menu item so that it can be selected and restores it from its grayed state.

            :STRING, 0x00000000, # Specifies that the menu item is a text string; the lpNewItem parameter is a pointer
            # to the string.

            :UNCHECKED, 0x00000000, # Does not place a check mark next to the menu item (default). If the application
            # supplies check-mark bitmaps (see the SetMenuItemBitmaps function), this flag displays the clear bitmap
            # next to the menu item.

            :INSERT, 0x00000000,

            :UNHILITE, 0x00000000,

            :GRAYED, 0x00000001, # Disables the menu item and grays it so it cannot be selected.

            :DISABLED, 0x00000002, # Disables the menu item so that it cannot be selected, but does not gray it.

            :BITMAP, 0x00000004, # Uses a bitmap as the menu item. The lpNewItem parameter contains a handle to the bitmap.

            :CHECKED, 0x00000008, # Places a check mark next to the menu item. If the application provides check-mark
            # bitmaps (see SetMenuItemBitmaps), this flag displays the check-mark bitmap next to the menu item.
            :POPUP, 0x00000010, # Specifies that the menu item opens a drop-down menu or submenu. The uIDNewItem parameter
            # specifies a handle to the drop-down menu or submenu. This flag is used to add a menu name to a menu bar or a
            # menu item that opens a submenu to a drop-down menu, submenu, or shortcut menu.

            :MENUBARBREAK, 0x00000020, # Functions the same as the :MENUBREAK flag for a menu bar. For a drop-down menu,
            # submenu, or shortcut menu, the new column is separated from the old column by a vertical line.

            :MENUBREAK, 0x00000040, # Places the item on a new line (for menu bars) or in a new column (for a drop-down
            # menu, submenu, or shortcut menu) without separating columns.

            :CHANGE, 0x00000080,

            :HILITE, 0x00000080,

            :END, 0x00000080,

            :OWNERDRAW, 0x00000100, # Specifies that the item is an owner-drawn item. Before the menu is displayed for the
            # first time, the window that owns the menu receives a WM_MEASUREITEM message to retrieve the width and height
            # of the menu item. The WM_DRAWITEM message is then sent to the window procedure of the owner window whenever
            # the appearance of the menu item must be updated.

            :APPEND, 0x00000100,

            :DELETE, 0x00000200,

            :USECHECKBITMAPS, 0x00000200,

            :BYPOSITION, 0x00000400, # Indicates that the uPosition parameter gives the zero-based relative position of the
            # new menu item. If uPosition is -1, the new menu item is appended to the end of the menu.

            :SEPARATOR, 0x00000800, # Draws a horizontal dividing line. This flag is used only in a drop-down menu, submenu,
            # or shortcut menu. The line cannot be grayed, disabled, or highlighted. The lpNewItem and uIDNewItem parameters
            # are ignored.

            :REMOVE, 0x00001000,

            :DEFAULT, 0x00001000,

            :SYSMENU, 0x00002000,

            :HELP, 0x00004000,

            :RIGHTJUSTIFY, 0x00004000,

            :MOUSESELECT, 0x00008000
        ]

        # System Objec

        OBJID_WINDOW            = 0x00000000
        OBJID_SYSMENU           = 0xFFFFFFFF
        OBJID_TITLEBAR          = 0xFFFFFFFE
        OBJID_MENU              = 0xFFFFFFFD
        OBJID_CLIENT            = 0xFFFFFFFC
        OBJID_VSCROLL           = 0xFFFFFFFB
        OBJID_HSCROLL           = 0xFFFFFFFA
        OBJID_SIZEGRIP          = 0xFFFFFFF9
        OBJID_CARET             = 0xFFFFFFF8
        OBJID_CURSOR            = 0xFFFFFFF7
        OBJID_ALERT             = 0xFFFFFFF6
        OBJID_SOUND             = 0xFFFFFFF5
        OBJID_QUERYCLASSNAMEIDX = 0xFFFFFFF4
        OBJID_NATIVEOM          = 0xFFFFFFF0

        class MENUBARINFO < FFI::Struct
          layout :cbSize,      :dword,
                 :rcBar,       RECT,
                 :hMenu,       :hmenu,
                 :hwndMenu,    :hwnd,
                 :fBarFocused, :bool,
                 :fFocused,    :bool
        end

        class MENUINFO < FFI::Struct
          layout :cbSize,          :dword,
                 :fMask,           :dword,
                 :dwStyle,         :dword,
                 :cyMax,           :uint,
                 :hbrBack,         :hbrush,
                 :dwContextHelpID, :dword,
                 :dwMenuData,      :ulong
        end

        class MENUITEMINFO < FFI::Struct
          layout :cbSize,        :uint,
                 :fMask,         :uint,
                 :ftype,         :uint,
                 :fState,        :uint,
                 :wID,           :uint,
                 :hSubMenu,      :hmenu,
                 :hbmpChecked,   :pointer,
                 :hbmpUnchecked, :pointer,
                 :dwItemData,    :ulong,
                 :dwTypeData,    :string,
                 :cch,           :uint,
                 :hbmpItem,      :pointer
        end

        class MENUITEMTEMPLATE < FFI::Struct
          layout :mtOption,  :word,
                 :mtID,      :word,
                 :mtString,  :char
        end

        class TPMPARAMS  < FFI::Struct
          layout :cbSize,    :uint,
                 :rcExclude, RECT
        end

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
  end
end