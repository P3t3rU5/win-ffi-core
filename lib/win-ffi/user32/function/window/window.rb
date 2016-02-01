require 'win-ffi/user32'

require 'win-ffi/user32/enum/color_types'
require 'win-ffi/user32/enum/window/flag/animate_window_flags'
require 'win-ffi/user32/enum/window/flag/get_window_flags'
require 'win-ffi/user32/enum/window/flag/set_window_pos_flags'
require 'win-ffi/user32/enum/window/flag/show_window_flags'
require 'win-ffi/user32/enum/window/flag/system_metrics_flags'
require 'win-ffi/user32/enum/resource/menu/track_popup_menu_flags'
require 'win-ffi/user32/enum/window/style/window_style'
require 'win-ffi/user32/enum/window/style/window_style_ex'
require 'win-ffi/user32/enum/window/get_ancestor_flags'
require 'win-ffi/user32/enum/window/message_filter'
require 'win-ffi/user32/enum/window/message_filter_info'
require 'win-ffi/user32/enum/window/window_display_affinity'
require 'win-ffi/user32/enum/feedback_type'
require 'win-ffi/user32/enum/window/child_window_from_point_ex_flags'

require 'win-ffi/general/struct/rect'
require 'win-ffi/user32/struct/window/window/alt_tab_info'
require 'win-ffi/user32/struct/window/window/flash_window_info'
require 'win-ffi/user32/struct/window/window/gui_thread_info'
require 'win-ffi/user32/struct/window/window/update_layered_window_info'
require 'win-ffi/user32/struct/window/window/title_bar_info'
require 'win-ffi/user32/struct/window/window/window_placement'
require 'win-ffi/user32/struct/window/window/window_info'
require 'win-ffi/user32/struct/window/window/change_filter_struct'

module WinFFI
  module User32

    typedef :pointer, :hdwp

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632665(v=vs.85).aspx
    # BOOL WINAPI AdjustWindowRect(
    #   _Inout_  LPRECT lpRect,
    #   _In_     DWORD dwStyle, // except WS_OVERLAPPED
    #   _In_     BOOL bMenu )
    attach_function 'AdjustWindowRect', [RECT.ptr, WindowStyle, :bool], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632667(v=vs.85).aspx
    # BOOL WINAPI AdjustWindowRectEx(
    #   _Inout_  LPRECT lpRect,
    #   _In_     DWORD dwStyle, // except WS_OVERLAPPED
    #   _In_     BOOL bMenu,
    #   _In_     DWORD dwExStyle )
    attach_function 'AdjustWindowRectEx', [RECT.ptr, WindowStyle, :bool, WindowStyleExtended], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632668(v=vs.85).aspx
    # BOOL WINAPI AllowSetForegroundWindow( _In_  DWORD dwProcessId )
    attach_function 'AllowSetForegroundWindow', [:dword], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632669(v=vs.85).aspx
    # BOOL WINAPI AnimateWindow(
    #   _In_  HWND hwnd,
    #   _In_  DWORD dwTime,
    #   _In_  DWORD dwFlags )
    attach_function 'AnimateWindow', [:hwnd, :dword, AnimateWindowFlags], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632670(v=vs.85).aspx
    # This function is provided only for compatibility with 16-bit versions of Windows. It is generally not useful.
    # BOOL WINAPI AnyPopup()
    attach_function 'AnyPopup', [], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632671(v=vs.85).aspx
    # UINT WINAPI ArrangeIconicWindows(_In_  HWND hWnd )
    attach_function 'ArrangeIconicWindows', [:hwnd], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632672(v=vs.85).aspx
    # HDWP WINAPI BeginDeferWindowPos( _In_  int nNumWindows )
    attach_function 'BeginDeferWindowPos', [:int], :hdwp

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632673(v=vs.85).aspx
    # BOOL WINAPI BringWindowToTop(_In_  HWND hWnd )
    attach_function 'BringWindowToTop', [:hwnd], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632674(v=vs.85).aspx
    # WORD WINAPI CascadeWindows(
    #   _In_opt_  HWND hwndParent,
    #   _In_      UINT wHow,
    #   _In_opt_  const RECT *lpRect,
    #   _In_      UINT cKids,
    #   _In_opt_  const HWND *lpKids )
    attach_function 'CascadeWindows', [:hwnd, :uint, RECT.ptr, :uint, :pointer], :word

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632676(v=vs.85).aspx
    # HWND WINAPI ChildWindowFromPoint(
    #   _In_  HWND hWndParent,
    #   _In_  POINT Point )
    attach_function 'ChildWindowFromPoint', [:hwnd, POINT], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632677(v=vs.85).aspx
    # HWND WINAPI ChildWindowFromPointEx(
    #   _In_  HWND hwndParent,
    #   _In_  POINT pt,
    #   _In_  UINT uFlags )
    attach_function 'ChildWindowFromPointEx', [:hwnd, POINT, ChildWindowFromPointExFlags], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632678(v=vs.85).aspx
    # Actually minimizes
    # BOOL CloseWindow(  __in HWND hWnd )
    attach_function 'CloseWindow', [:hwnd], :bool

    # void WINAPI CreateOwnedToolWindow(
    #   _In_      IInspectable *pOwnerWindow,
    #   _In_opt_  LPCTSTR lpWindowNTitle,
    #   _In_      int x,
    #   _In_      int y,
    #   _In_      UINT32 nWidth,
    #   _In_      UINT32 nHeight,
    #   _Out_     IInspectable **ppWindow)
    # attach_function 'CreateOwnedToolWindow', [:pointer, :string, :int, :int, :uint32, :uint32, :pointer], :void

    class << self
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632679(v=vs.85).aspx
      # HWND WINAPI CreateWindow(
      #   _In_opt_ LPCTSTR   lpClassName,
      #   _In_opt_ LPCTSTR   lpWindowName,
      #   _In_     DWORD     dwStyle,
      #   _In_     int       x,
      #   _In_     int       y,
      #   _In_     int       nWidth,
      #   _In_     int       nHeight,
      #   _In_opt_ HWND      hWndParent,
      #   _In_opt_ HMENU     hMenu,
      #   _In_opt_ HINSTANCE hInstance,
      #   _In_opt_ LPVOID    lpParam)
      def CreateWindow(lpClassName, lpWindowName, dwStyle, x, y, nWidth, nHeight, hWndParent, hMenu, hInstance, lpParam)
        CreateWindowEx(0, lpClassName, lpWindowName, dwStyle, x, y, nWidth, nHeight, hWndParent, hMenu, hInstance, lpParam)
      end

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633509(v=vs.85).aspx
      # HWND WINAPI GetNextWindow(
      #   _In_  HWND hWnd,
      #   _In_  UINT wCmd )
      def GetNextWindow(hWnd, wCmd)
        GetWindow(hWnd, wCmd.is_a?(Symbol) ? GetWindowFlags[wCmd] : wCmd)
      end
    end

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632680(v=vs.85).aspx
    # HWND CreateWindowEx(
    #   __in      DWORD     dwExStyle,
    #   __in_opt  LPCTSTR   lpClassName,
    #   __in_opt  LPCTSTR   lpWindowName,
    #   __in      DWORD     dwStyle,
    #   __in      int       x,
    #   __in      int       y,
    #   __in      int       nWidth,
    #   __in      int       nHeight,
    #   __in_opt  HWND      hWndParent,
    #   __in_opt  HMENU     hMenu,
    #   __in_opt  HINSTANCE hInstance,
    #   __in_opt  LPVOID    lpParam )
    encoded_function 'CreateWindowEx', [:dword, :pointer, :buffer_in , :dword, :int, :int, :int, :int, :hwnd, :hmenu, :hinstance, :pointer], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632681(v=vs.85).aspx
    # HDWP WINAPI DeferWindowPos(
    #   _In_      HDWP hWinPosInfo,
    #   _In_      HWND hWnd,
    #   _In_opt_  HWND hWndInsertAfter,
    #   _In_      int x,
    #   _In_      int y,
    #   _In_      int cx,
    #   _In_      int cy,
    #   _In_      UINT uFlags )
    attach_function 'DeferWindowPos', [:pointer, :hwnd, :hwnd, :int, :int, :int, :int, SetWindowPosFlags], :hdwp

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644979(v=vs.85).aspx
    # BOOL WINAPI DeregisterShellHookWindow( _In_  HWND hWnd )
    attach_function 'DeregisterShellHookWindow', [:hwnd], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632682(v=vs.85).aspx
    # BOOL DestroyWindow(__in  HWND hWnd)
    attach_function 'DestroyWindow', [:hwnd], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633440(v=vs.85).aspx
    # BOOL WINAPI EndDeferWindowPos( _In_  HDWP hWinPosInfo )
    attach_function 'EndDeferWindowPos', [:hdwp], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633492(v=vs.85).aspx
    # This function is not intended for general use. It may be altered or unavailable in subsequent versions of Windows.
    # BOOL WINAPI EndTask(
    #   _In_  HWND hWnd,
    #   _In_  BOOL fShutDown,
    #   _In_  BOOL fForce )
    attach_function 'EndTask', [:hwnd, :bool, :bool], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633493(v=vs.85).aspx
    # BOOL CALLBACK EnumChildProc(
    # _In_ HWND   hwnd,
    # _In_ LPARAM lParam)
    EnumChildProc = callback 'EnumChildProc', [:hwnd, :lparam], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633494(v=vs.85).aspx
    # BOOL WINAPI EnumChildWindows(
    #   _In_opt_  HWND hWndParent,
    #   _In_      WNDENUMPROC lpEnumFunc,
    #   _In_      LPARAM lParam )
    attach_function 'EnumChildWindows', [:hwnd, EnumChildProc, :lparam], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633496(v=vs.85).aspx
    # BOOL CALLBACK EnumThreadWndProc(
    #   _In_  HWND hwnd,
    #   _In_  LPARAM lParam )
    EnumThreadWndProc = callback 'EnumThreadWndProc', [:hwnd, :lparam], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633495(v=vs.85).aspx
    # BOOL WINAPI EnumThreadWindows(
    #   _In_  DWORD dwThreadId,
    #   _In_  WNDENUMPROC lpfn,
    #   _In_  LPARAM lParam )
    attach_function 'EnumThreadWindows', [:dword, EnumThreadWndProc, :lparam], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633498(v=vs.85).aspx
    # BOOL CALLBACK EnumWindowsProc(
    # _In_ HWND   hwnd,
    # _In_ LPARAM lParam )
    EnumWindowsProc = callback 'EnumWindowsProc', [:hwnd, :lparam], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633497(v=vs.85).aspx
    # BOOL WINAPI EnumWindows(
    #   _In_  WNDENUMPROC lpEnumFunc,
    #   _In_  LPARAM lParam )
    attach_function 'EnumWindows', [EnumWindowsProc, :lparam], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633499(v=vs.85).aspx
    # HWND WINAPI FindWindow(
    #   _In_opt_  LPCTSTR lpClassName,
    #   _In_opt_  LPCTSTR lpWindowName )
    encoded_function 'FindWindow', [:buffer_in, :buffer_in], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633500(v=vs.85).aspx
    # HWND WINAPI FindWindowEx(
    #   _In_opt_  HWND hwndParent,
    #   _In_opt_  HWND hwndChildAfter,
    #   _In_opt_  LPCTSTR lpszClass,
    #   _In_opt_  LPCTSTR lpszWindow )
    encoded_function 'FindWindowEx', [:hwnd, :hwnd, :buffer_in, :buffer_in], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633501(v=vs.85).aspx
    # BOOL WINAPI GetAltTabInfo(
    #   _In_opt_   HWND hwnd,
    #   _In_       int iItem,
    #   _Inout_    PALTTABINFO pati,
    #   _Out_opt_  LPTSTR pszItemText,
    #   _In_       UINT cchItemText )
    encoded_function 'GetAltTabInfo', [:hwnd, :int, ALTTABINFO.ptr, :string, :uint], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633502(v=vs.85).aspx
    # HWND WINAPI GetAncestor(
    #   _In_  HWND hwnd,
    #   _In_  UINT gaFlags )
    attach_function 'GetAncestor', [:hwnd, GetAncestorFlags], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633503(v=vs.85).aspx
    # BOOL GetClientRect(
    #   __in   HWND   hWnd,
    #   __out  LPRECT lpRect)
    attach_function 'GetClientRect', [:hwnd, RECT.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633504(v=vs.85).aspx
    # HWND GetDesktopWindow(void)
    attach_function 'GetDesktopWindow', [], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633505(v=vs.85).aspx
    # HWND WINAPI GetForegroundWindow(void)
    attach_function 'GetForegroundWindow', [], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633506(v=vs.85).aspx
    # BOOL WINAPI GetGUIThreadInfo(
    #   _In_     DWORD idThread,
    #   _Inout_  LPGUITHREADINFO lpgui )
    attach_function 'GetGUIThreadInfo', [:dword, GUITHREADINFO.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633507(v=vs.85).aspx
    # HWND WINAPI GetLastActivePopup( _In_  HWND hWnd )
    attach_function 'GetLastActivePopup', [:hwnd], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633510(v=vs.85).aspx
    # HWND WINAPI GetParent( _In_  HWND hWnd )
    attach_function 'GetParent', [:hwnd], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633511(v=vs.85).aspx
    # BOOL WINAPI GetProcessDefaultLayout( _Out_  DWORD *pdwDefaultLayout )
    attach_function 'GetProcessDefaultLayout', [:dword], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633512(v=vs.85).aspx
    # HWND GetShellWindow(void)
    attach_function 'GetShellWindow', [], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724371(v=vs.85).aspx
    # DWORD WINAPI GetSysColor( _In_  int nIndex )
    attach_function 'GetSysColor', [ColorTypes], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633513(v=vs.85).aspx
    # BOOL WINAPI GetTitleBarInfo(
    #   _In_     HWND hwnd,
    #   _Inout_  PTITLEBARINFO pti )
    attach_function 'GetTitleBarInfo', [:hwnd, TITLEBARINFO.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633514(v=vs.85).aspx
    # HWND WINAPI GetTopWindow(   _In_opt_  HWND hWnd )
    attach_function 'GetTopWindow', [:hwnd], :hwnd

    # http://www.ebay.co.uk/itm/351527991631?_trksid=p2055119.m1438.l2649&ssPageName=STRK%3AMEBIDX%3AIT
    # HWND WINAPI GetWindow(
    #   _In_  HWND hWnd,
    #   _In_  UINT uCmd )
    attach_function 'GetWindow', [:hwnd, GetWindowFlags], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633516(v=vs.85).aspx
    # BOOL GetWindowInfo(
    #   __in     HWND        hwnd,
    #   __inout  PWINDOWINFO pwi)
    attach_function 'GetWindowInfo', [:hwnd, WINDOWINFO.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633517(v=vs.85).aspx
    # UINT WINAPI GetWindowModuleFileName(
    #   _In_   HWND hwnd,
    #   _Out_  LPTSTR lpszFileName,
    #   _In_   UINT cchFileNameMax )
    encoded_function 'GetWindowModuleFileName',  [:hwnd, :string, :uint], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633518(v=vs.85).aspx
    # BOOL GetWindowPlacement(
    #   __in     HWND             hWnd,
    #   __inout  WINDOWPLACEMENT *lpwndpl)
    attach_function 'GetWindowPlacement', [:hwnd, WINDOWPLACEMENT.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633519(v=vs.85).aspx
    # BOOL GetWindowRect(
    #   __in   HWND   hWnd,
    #   __out  LPRECT lpRect)
    attach_function 'GetWindowRect', [:hwnd, RECT.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633520(v=vs.85).aspx
    # int WINAPI GetWindowText(
    #   _In_   HWND hWnd,
    #   _Out_  LPTSTR lpString,
    #   _In_   int nMaxCount )
    encoded_function 'GetWindowText', [:hwnd, :pointer, :int], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633521(v=vs.85).aspx
    # int WINAPI GetWindowTextLength( _In_  HWND hWnd )
    encoded_function 'GetWindowTextLength', [:hwnd], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633522(v=vs.85).aspx
    # DWORD WINAPI GetWindowThreadProcessId(
    #   _In_       HWND hWnd,
    #   _Out_opt_  LPDWORD lpdwProcessId )
    attach_function 'GetWindowThreadProcessId', [:hwnd, :pointer], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633523(v=vs.85).aspx
    # This function is not intended for general use. It may be altered or unavailable in subsequent versions of Windows.
    # int WINAPI InternalGetWindowText(
    #   _In_   HWND hWnd,
    #   _Out_  LPWSTR lpString,
    #   _In_   int nMaxCount )
    attach_function 'InternalGetWindowText', [:hwnd, :string, :int], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633524(v=vs.85).aspx
    # BOOL WINAPI IsChild(
    #   _In_  HWND hWndParent,
    #   _In_  HWND hWnd )
    attach_function 'IsChild', [:hwnd, :hwnd], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633526(v=vs.85).aspx
    # BOOL WINAPI IsHungAppWindow( _In_  HWND hWnd )
    attach_function 'IsHungAppWindow', [:hwnd], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633527(v=vs.85).aspx
    # BOOL WINAPI IsIconic( _In_  HWND hWnd )
    attach_function 'IsIconic', [:hwnd], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633528(v=vs.85).aspx
    # BOOL WINAPI IsWindow( _In_opt_  HWND hWnd )
    attach_function 'IsWindow', [:hwnd], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633529(v=vs.85).aspx
    # BOOL WINAPI IsWindowUnicode( _In_  HWND hWnd )
    attach_function 'IsWindowUnicode', [:hwnd], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633530(v=vs.85).aspx
    # BOOL WINAPI IsWindowVisible( _In_  HWND hWnd )
    attach_function 'IsWindowVisible', [:hwnd], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633531(v=vs.85).aspx
    # BOOL WINAPI IsZoomed( _In_  HWND hWnd )
    attach_function 'IsZoomed', [:hwnd], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633532(v=vs.85).aspx
    # BOOL WINAPI LockSetForegroundWindow( _In_  UINT uLockCode )
    attach_function 'LockSetForegroundWindow', [:uint], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633534(v=vs.85).aspx
    # BOOL WINAPI MoveWindow(
    #   __in  HWND hWnd,
    #   __in  int  X,
    #   __in  int  Y,
    #   __in  int  nWidth,
    #   __in  int  nHeight,
    #   __in  BOOL bRepaint)
    attach_function 'MoveWindow', [:hwnd, :int, :int, :int, :int, :bool], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633535(v=vs.85).aspx
    # BOOL WINAPI OpenIcon( _In_  HWND hWnd )
    attach_function 'OpenIcon', [:hwnd], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633537(v=vs.85).aspx
    # HWND WINAPI RealChildWindowFromPoint(
    #   _In_  HWND hwndParent,
    #   _In_  POINT ptParentClientCoords )
    attach_function 'RealChildWindowFromPoint', [:hwnd, POINT.ptr], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633538(v=vs.85).aspx
    # UINT WINAPI RealGetWindowClass(
    #   _In_   HWND hwnd,
    #   _Out_  LPTSTR pszType,
    #   _In_   UINT cchType )
    encoded_function 'RealGetWindowClass', [:hwnd, :string, :uint], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644989(v=vs.85).aspx
    # BOOL WINAPI RegisterShellHookWindow( _In_  HWND hWnd )
    attach_function 'RegisterShellHookWindow', [:hwnd], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633539(v=vs.85).aspx
    # BOOL WINAPI SetForegroundWindow( _In_  HWND hWnd )
    attach_function 'SetForegroundWindow', [:hwnd], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633540(v=vs.85).aspx
    # BOOL WINAPI SetLayeredWindowAttributes(
    #   _In_  HWND hwnd,
    #   _In_  COLORREF crKey,
    #   _In_  BYTE bAlpha,
    #   _In_  DWORD dwFlags )
    attach_function 'SetLayeredWindowAttributes', [:hwnd, :colorref, :byte, LayeredWindowAttributesFlags], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633541(v=vs.85).aspx
    # HWND WINAPI SetParent(
    #   _In_      HWND hWndChild,
    #   _In_opt_  HWND hWndNewParent )
    attach_function 'SetParent', [:hwnd, :hwnd], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633542(v=vs.85).aspx
    # BOOL WINAPI SetProcessDefaultLayout( _In_  DWORD dwDefaultLayout )
    attach_function 'SetProcessDefaultLayout', [:dword], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724940(v=vs.85).aspx
    # BOOL WINAPI SetSysColors(
    #   _In_  int cElements,
    #   _In_  const INT *lpaElements,
    #   _In_  const COLORREF *lpaRgbValues )
    attach_function 'SetSysColors', [:int, :pointer, :pointer], :bool
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633544(v=vs.85).aspx
    # BOOL SetWindowPlacement(
    #   __in     HWND             hWnd,
    #   __inout  WINDOWPLACEMENT *lpwndpl)
    attach_function 'SetWindowPlacement', [:hwnd, WINDOWPLACEMENT.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633544(v=vs.85).aspx
    # BOOL WINAPI SetWindowPos(
    #   _In_      HWND hWnd,
    #   _In_opt_  HWND hWndInsertAfter,
    #   _In_      int X,
    #   _In_      int Y,
    #   _In_      int cx,
    #   _In_      int cy,
    #   _In_      UINT uFlags )
    attach_function 'SetWindowPos', [:hwnd, :hwnd, :int, :int, :int, :int, SetWindowPosFlags], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633546(v=vs.85).aspx
    # BOOL WINAPI SetWindowText(
    #   __in      HWND    hWnd,
    #   __in_opt  LPCTSTR lpString)
    encoded_function 'SetWindowText', [:hwnd, :string], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633547(v=vs.85).aspx
    # BOOL WINAPI ShowOwnedPopups(
    #   _In_  HWND hWnd,
    #   _In_  BOOL fShow )
    attach_function 'ShowOwnedPopups', [:hwnd, :bool], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633548(v=vs.85).aspx
    # BOOL ShowWindow(
    #   __in  HWND hWnd,
    #   __in  int  nCmdShow)
    attach_function 'ShowWindow', [:hwnd, ShowWindowFlags], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633549(v=vs.85).aspx
    # BOOL WINAPI ShowWindowAsync(
    #   _In_  HWND hWnd,
    #   _In_  int nCmdShow )
    attach_function 'ShowWindowAsync', [:hwnd, :int], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633553(v=vs.85).aspx
    # This function is not intended for general use. It may be altered or unavailable in subsequent versions of Windows.
    # VOID WINAPI SwitchToThisWindow(
    #   _In_  HWND hWnd,
    #   _In_  BOOL fAltTab )
    attach_function 'SwitchToThisWindow', [:hwnd, :bool], :void

    # WORD WINAPI TileWindows(
    #   _In_opt_  HWND hwndParent,
    #   _In_      UINT wHow,
    #   _In_opt_  const RECT *lpRect,
    #   _In_      UINT cKids,
    #   _In_opt_  const HWND *lpKids )
    attach_function 'TileWindows', [:hwnd, :uint, RECT.ptr, :uint, :pointer], :word

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633554(v=vs.85).aspx
    # BOOL WINAPI UpdateLayeredWindow(
    #   _In_      HWND hwnd,
    #   _In_opt_  HDC hdcDst,
    #   _In_opt_  POINT *pptDst,
    #   _In_opt_  SIZE *psize,
    #   _In_opt_  HDC hdcSrc,
    #   _In_opt_  POINT *pptSrc,
    #   _In_      COLORREF crKey,
    #   _In_opt_  BLENDFUNCTION *pblend,
    #   _In_      DWORD dwFlags )
    attach_function 'UpdateLayeredWindow', [:hwnd, :hdc, POINT.ptr, SIZE.ptr, :hdc, POINT.ptr, :colorref, :pointer, LayeredWindowAttributesFlags], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633558(v=vs.85).aspx
    # HWND WINAPI WindowFromPoint( _In_  POINT Point )
    attach_function 'WindowFromPoint', [POINT.ptr], :hwnd

    # int CALLBACK WinMain(
    #   _In_  HINSTANCE hInstance,
    #   _In_  HINSTANCE hPrevInstance,
    #   _In_  LPSTR lpCmdLine,
    #   _In_  int nCmdShow )
    WinMain = callback 'WinMain', [:hinstance, :hinstance, :string, ShowWindowFlags], :int

    if WindowsVersion >= :xp
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679346(v=vs.85).aspx
      # BOOL WINAPI FlashWindow(
      #   _In_  HWND hWnd,
      #   _In_  BOOL bInvert )
      attach_function 'FlashWindow', [:hwnd, :bool], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679347(v=vs.85).aspx
      # BOOL WINAPI FlashWindowEx( _In_  PFLASHWINFO pfwi )
      attach_function 'FlashWindowEx', [FLASHWINFO.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633508(v=vs.85).aspx
      # BOOL WINAPI GetLayeredWindowAttributes(
      #   _In_       HWND hwnd,
      #   _Out_opt_  COLORREF *pcrKey,
      #   _Out_opt_  BYTE *pbAlpha,
      #   _Out_opt_  DWORD *pdwFlags )
      attach_function 'GetLayeredWindowAttributes', [:hwnd, :pointer, :pointer, LayeredWindowAttributesFlags], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633525(v=vs.85).aspx
      # BOOL WINAPI IsGUIThread( _In_  BOOL bConvert )
      attach_function 'IsGUIThread', [:bool], :bool

      if WindowsVersion >= :vista
        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632675(v=vs.85).aspx
        # BOOL WINAPI ChangeWindowMessageFilter(
        #   _In_  UINT message,
        #   _In_  DWORD dwFlag )
        attach_function 'ChangeWindowMessageFilter', [:uint, MessageFilter], :bool

        # BOOL WINAPI GetWindowMinimizeRect (
        #   HWND hwndToQuery,
        #   RECT* pRect )
        attach_function 'GetWindowMinimizeRect', [:hwnd, WinFFI::RECT.ptr], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa969261(v=vs.85).aspx
        # BOOL WINAPI IsProcessDPIAware(void)
        attach_function 'IsProcessDPIAware', [], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633533(v=vs.85).aspx
        # BOOL WINAPI LogicalToPhysicalPoint(
        #   _In_     HWND hWnd,
        #   _Inout_  LPPOINT lpPoint )
        attach_function 'LogicalToPhysicalPoint', [:hwnd, POINT.ptr], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633536(v=vs.85).aspx
        # BOOL WINAPI PhysicalToLogicalPoint(
        #   _In_     HWND hWnd,
        #   _Inout_  LPPOINT lpPoint )
        attach_function 'PhysicalToLogicalPoint', [:hwnd, POINT.ptr], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633543(v=vs.85).aspx
        # BOOL WINAPI SetProcessDPIAware(void)
        attach_function 'SetProcessDPIAware', [], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa969269(v=vs.85).aspx
        # BOOL WINAPI SoundSentry(void)
        attach_function 'SoundSentry', [], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633557(v=vs.85).aspx
        # BOOL WINAPI UpdateLayeredWindowIndirect(
        #   _In_  HWND hwnd,
        #   _In_  const UPDATELAYEREDWINDOWINFO *pULWInfo )
        attach_function 'UpdateLayeredWindowIndirect', [:hwnd, UPDATELAYEREDWINDOWINFO.ptr], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa969270(v=vs.85).aspx
        #HWND WINAPI WindowFromPhysicalPoint( _In_  POINT Point )
        attach_function 'WindowFromPhysicalPoint', [POINT.ptr], :hwnd

        if WindowsVersion >= 7
          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd565861(v=vs.85).aspx
          # BOOL WINAPI CalculatePopupWindowPosition(
          #   _In_      const POINT *anchorPoint,
          #   _In_      const SIZE *windowSize,
          #   _In_      UINT flags,
          #   _In_opt_  RECT *excludeRect,
          #   _Out_     RECT *popupWindowPosition )
          attach_function 'CalculatePopupWindowPosition', [POINT.ptr, SIZE.ptr, TrackPopupMenuFlags, RECT.ptr, RECT.ptr], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd388202(v=vs.85).aspx
          # BOOL WINAPI ChangeWindowMessageFilterEx(
          #   _In_         HWND hWnd,
          #   _In_         UINT message,
          #   _In_         DWORD action,
          #   _Inout_opt_  PCHANGEFILTERSTRUCT pChangeFilterStruct )
          attach_function 'ChangeWindowMessageFilterEx', [:hwnd, :uint, MessageFilter, CHANGEFILTERSTRUCT.ptr], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd375338(v=vs.85).aspx
          # BOOL WINAPI GetWindowDisplayAffinity(
          #   _In_   HWND hWnd,
          #   _Out_  DWORD *dwAffinity )
          attach_function 'GetWindowDisplayAffinity', [:hwnd, WindowDisplayAffinity], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd375340(v=vs.85).aspx
          # BOOL WINAPI SetWindowDisplayAffinity(
          #   _In_  HWND hWnd,
          #   _In_  DWORD dwAffinity )
          attach_function 'SetWindowDisplayAffinity', [:hwnd, WindowDisplayAffinity], :bool

          if WindowsVersion >= 8
            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh405402(v=vs.85).aspx
            # BOOL WINAPI SetWindowFeedbackSetting(
            #   _In_           HWND          hwnd,
            #   _In_           FEEDBACK_TYPE feedback,
            #   _In_           DWORD         flags,
            #   _In_           UINT32        size,
            #   _In_opt_ const VOID          *configuration)
            attach_function 'SetWindowFeedbackSetting', [:hwnd, FEEDBACK_TYPE, :dword, :uint, :pointer], :bool
          end
        end
      end
    end
  end
end