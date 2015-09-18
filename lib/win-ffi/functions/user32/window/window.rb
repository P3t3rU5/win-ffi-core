require 'win-ffi/functions/user32'

require 'win-ffi/enums/color_types'
require 'win-ffi/enums/user32/window/animate_window_flags'
require 'win-ffi/enums/user32/window/get_window_flags'
require 'win-ffi/enums/user32/window/set_window_pos_flags'
require 'win-ffi/enums/user32/window/show_window_flags'
require 'win-ffi/enums/user32/window/system_metrics_flags'
require 'win-ffi/enums/user32/window/track_popup_menu_flags'
require 'win-ffi/enums/user32/window/style/window_style'
require 'win-ffi/enums/user32/window/style/window_style_ex'
require 'win-ffi/enums/user32/get_ancestor_flags'
require 'win-ffi/enums/user32/message_filter'

require 'win-ffi/structs/user32/window/alt_tab_info'
require 'win-ffi/structs/user32/window/flashw_info'
require 'win-ffi/structs/user32/window/gui_thread_info'
require 'win-ffi/structs/user32/window/update_layered_window_info'
require 'win-ffi/structs/user32/window/title_bar_info'
require 'win-ffi/structs/user32/window/window_placement'

module WinFFI
  module User32

    typedef :pointer, :hdwp

    #BOOL WINAPI AdjustWindowRect(
    # _Inout_  LPRECT lpRect,
    # _In_     DWORD dwStyle, // except WS_OVERLAPPED
    # _In_     BOOL bMenu )
    attach_function 'AdjustWindowRect', [WinFFI::RECT.ptr, WindowStyle, :bool], :bool

    #BOOL WINAPI AdjustWindowRectEx(
    # _Inout_  LPRECT lpRect,
    # _In_     DWORD dwStyle, // except WS_OVERLAPPED
    # _In_     BOOL bMenu,
    # _In_     DWORD dwExStyle )
    attach_function 'AdjustWindowRectEx', [WinFFI::RECT.ptr, WindowStyle, :bool, WindowStyleEx], :bool

    # BOOL WINAPI AllowSetForegroundWindow( _In_  DWORD dwProcessId )
    attach_function 'AllowSetForegroundWindow', [:dword], :bool

    #BOOL WINAPI AnimateWindow(
    # _In_  HWND hwnd,
    # _In_  DWORD dwTime,
    # _In_  DWORD dwFlags )
    attach_function 'AnimateWindow', [:hwnd, :dword, AnimateWindowFlags], :bool

    #BOOL WINAPI AnyPopup( void )
    attach_function 'AnyPopup', [ ], :bool

    #UINT WINAPI ArrangeIconicWindows( _In_  HWND hWnd )
    attach_function 'ArrangeIconicWindows', [:hwnd], :uint

    #HDWP WINAPI BeginDeferWindowPos( _In_  int nNumWindows )
    attach_function 'BeginDeferWindowPos', [:int], :hdwp

    #BOOL WINAPI BringWindowToTop(_In_  HWND hWnd )
    attach_function 'BringWindowToTop', [:hwnd], :bool

    #WORD WINAPI CascadeWindows(
    #  _In_opt_  HWND hwndParent,
    #  _In_      UINT wHow,
    #  _In_opt_  const RECT *lpRect,
    #  _In_      UINT cKids,
    #  _In_opt_  const HWND *lpKids )
    attach_function 'CascadeWindows', [:hwnd, :uint, WinFFI::RECT.ptr, :uint, :pointer], :word

    #HWND WINAPI ChildWindowFromPoint(
    #  _In_  HWND hWndParent,
    #  _In_  POINT Point )
    attach_function 'ChildWindowFromPoint', [:hwnd, POINT], :hwnd

    #HWND WINAPI ChildWindowFromPointEx(
    #  _In_  HWND hwndParent,
    #  _In_  POINT pt,
    #  _In_  UINT uFlags )
    attach_function 'ChildWindowFromPointEx', [:hwnd, POINT, :uint], :hwnd

    #Actually minimizes
    #BOOL CloseWindow(  __in HWND hWnd )
    attach_function 'CloseWindow', [:hwnd], :bool

    #void WINAPI CreateOwnedToolWindow(
    #  _In_      IInspectable *pOwnerWindow,
    #  _In_opt_  LPCTSTR lpWindowNTitle,
    #  _In_      int x,
    #  _In_      int y,
    #  _In_      UINT32 nWidth,
    #  _In_      UINT32 nHeight,
    #  _Out_     IInspectable **ppWindow)
    #attach_function 'CreateOwnedToolWindow', [:pointer, :string, :int, :int, :uint32, :uint32, :pointer], :void

    class << self
      def CreateWindowA(lpClassName, lpWindowName, dwStyle, x, y, nWidth, nHeight, hWndParent, hMenu, hInstance, lpParam)
        CreateWindowExA(0, lpClassName, lpWindowName, dwStyle, x, y, nWidth, nHeight, hWndParent, hMenu, hInstance, lpParam)
      end

      def CreateWindowW(lpClassName, lpWindowName, dwStyle, x, y, nWidth, nHeight, hWndParent, hMenu, hInstance, lpParam)
        CreateWindowExW(0, lpClassName, lpWindowName, dwStyle, x, y, nWidth, nHeight, hWndParent, hMenu, hInstance, lpParam)
      end
    end

    #HWND CreateWindowEx(
    #  __in      DWORD     dwExStyle,
    #  __in_opt  LPCTSTR   lpClassName,
    #  __in_opt  LPCTSTR   lpWindowName,
    #  __in      DWORD     dwStyle,
    #  __in      int       x,
    #  __in      int       y,
    #  __in      int       nWidth,
    #  __in      int       nHeight,
    #  __in_opt  HWND      hWndParent,
    #  __in_opt  HMENU     hMenu,
    #  __in_opt  HINSTANCE hInstance,
    #  __in_opt  LPVOID    lpParam )
    attach_function 'CreateWindowExA', [:dword, :pointer, :buffer_in , :dword, :int, :int, :int, :int, :hwnd, :hmenu, :hinstance, :pointer], :hwnd
    attach_function 'CreateWindowExW', [:dword, :pointer, :buffer_in , :dword, :int, :int, :int, :int, :hwnd, :hmenu, :hinstance, :pointer], :hwnd

    #HDWP WINAPI DeferWindowPos(
    #  _In_      HDWP hWinPosInfo,
    #  _In_      HWND hWnd,
    #  _In_opt_  HWND hWndInsertAfter,
    #  _In_      int x,
    #  _In_      int y,
    #  _In_      int cx,
    #  _In_      int cy,
    #  _In_      UINT uFlags )
    attach_function 'DeferWindowPos', [:pointer, :hwnd, :hwnd, :int, :int, :int, :int, SetWindowPosFlags], :hdwp

    #BOOL WINAPI DeregisterShellHookWindow( _In_  HWND hWnd )
    attach_function 'DeregisterShellHookWindow', [:hwnd], :bool

    #BOOL DestroyWindow(
    #  __in  HWND hWnd)
    attach_function 'DestroyWindow', [:hwnd], :bool

    #BOOL WINAPI EndDeferWindowPos( _In_  HDWP hWinPosInfo )
    attach_function 'EndDeferWindowPos', [:hdwp], :bool

    #BOOL WINAPI EndTask(
    #  _In_  HWND hWnd,
    #  _In_  BOOL fShutDown,
    #  _In_  BOOL fForce )
    attach_function 'EndTask', [:hwnd, :bool, :bool], :bool

    #BOOL WINAPI EnumChildWindows(
    #  _In_opt_  HWND hWndParent,
    #  _In_      WNDENUMPROC lpEnumFunc,
    #  _In_      LPARAM lParam )
    attach_function 'EnumChildWindows', [:hwnd, :pointer, :lparam], :bool

    #BOOL WINAPI EnumThreadWindows(
    #  _In_  DWORD dwThreadId,
    #  _In_  WNDENUMPROC lpfn,
    #  _In_  LPARAM lParam )
    attach_function 'EnumThreadWindows', [:dword, :pointer, :lparam], :bool

    #BOOL CALLBACK EnumThreadWndProc(
    #  _In_  HWND hwnd,
    #  _In_  LPARAM lParam )
    callback 'EnumThreadWndProc', [:hwnd, :lparam], :bool

    #TODO
    #BOOL WINAPI EnumWindows(
    #  _In_  WNDENUMPROC lpEnumFunc,
    #  _In_  LPARAM lParam )
    attach_function 'EnumWindows', [:pointer, :lparam], :bool

    #HWND WINAPI FindWindow(
    #  _In_opt_  LPCTSTR lpClassName,
    #  _In_opt_  LPCTSTR lpWindowName )
    attach_function 'FindWindowA', [:buffer_in, :buffer_in], :hwnd
    attach_function 'FindWindowW', [:buffer_in, :buffer_in], :hwnd

    #HWND WINAPI FindWindowEx(
    #  _In_opt_  HWND hwndParent,
    #  _In_opt_  HWND hwndChildAfter,
    #  _In_opt_  LPCTSTR lpszClass,
    #  _In_opt_  LPCTSTR lpszWindow )
    attach_function 'FindWindowExA', [:hwnd, :hwnd, :buffer_in, :buffer_in], :hwnd
    attach_function 'FindWindowExW', [:hwnd, :hwnd, :buffer_in, :buffer_in], :hwnd

    #BOOL WINAPI FlashWindow(
    #  _In_  HWND hWnd,
    #  _In_  BOOL bInvert )
    attach_function 'FlashWindow', [:hwnd, :bool], :bool

    #BOOL WINAPI FlashWindowEx( _In_  PFLASHWINFO pfwi )
    attach_function 'FlashWindowEx', [FLASHWINFO.ptr], :bool

    #BOOL WINAPI GetAltTabInfo(
    #  _In_opt_   HWND hwnd,
    #  _In_       int iItem,
    #  _Inout_    PALTTABINFO pati,
    #  _Out_opt_  LPTSTR pszItemText,
    #  _In_       UINT cchItemText )
    attach_function 'GetAltTabInfoA', [:hwnd, :int, ALTTABINFO.ptr, :string, :uint], :bool
    attach_function 'GetAltTabInfoW', [:hwnd, :int, ALTTABINFO.ptr, :string, :uint], :bool

    #HWND WINAPI GetAncestor(
    #  _In_  HWND hwnd,
    #  _In_  UINT gaFlags )
    attach_function 'GetAncestor', [:hwnd, GetAncestorFlags], :hwnd

    #BOOL GetClientRect(
    #  __in   HWND   hWnd,
    #  __out  LPRECT lpRect)
    attach_function 'GetClientRect', [:hwnd, WinFFI::RECT.ptr], :bool

    #HWND GetDesktopWindow(void)
    attach_function 'GetDesktopWindow', [], :hwnd

    #HWND WINAPI GetForegroundWindow(void)
    attach_function 'GetForegroundWindow', [], :hwnd

    #BOOL WINAPI GetGUIThreadInfo(
    #  _In_     DWORD idThread,
    #  _Inout_  LPGUITHREADINFO lpgui )
    attach_function 'GetGUIThreadInfo', [:dword, GUITHREADINFO.ptr], :bool

    #HWND WINAPI GetLastActivePopup( _In_  HWND hWnd )
    attach_function 'GetLastActivePopup', [:hwnd], :hwnd

    #HWND WINAPI GetNextWindow(
    #  _In_  HWND hWnd,
    #  _In_  UINT wCmd )
    #attach_function 'GetNextWindow', [:hwnd, GetWindowFlags], :hwnd

    #HWND WINAPI GetParent( _In_  HWND hWnd )
    attach_function 'GetParent', [:hwnd], :hwnd

    #BOOL WINAPI GetProcessDefaultLayout( _Out_  DWORD *pdwDefaultLayout )
    attach_function 'GetProcessDefaultLayout', [:pointer], :bool

    #HWND GetShellWindow(void)
    attach_function 'GetShellWindow', [], :hwnd

    #DWORD WINAPI GetSysColor( _In_  int nIndex )
    attach_function 'GetSysColor', [ColorTypes], :dword

    #int WINAPI GetSystemMetrics( _In_  int nIndex )
    attach_function 'GetSystemMetrics', [SystemMetricsFlags], :int

    #BOOL WINAPI GetTitleBarInfo(
    #  _In_     HWND hwnd,
    #  _Inout_  PTITLEBARINFO pti )
    attach_function 'GetTitleBarInfo', [:hwnd, TITLEBARINFO.ptr], :bool

    #HWND WINAPI GetTopWindow(   _In_opt_  HWND hWnd )
    attach_function 'GetTopWindow', [:hwnd], :hwnd

    #HWND WINAPI GetWindow(
    #  _In_  HWND hWnd,
    #  _In_  UINT uCmd )
    attach_function 'GetWindow', [:hwnd, GetWindowFlags], :hwnd

    #TODO
    #BOOL GetWindowInfo(
    #  __in     HWND        hwnd,
    #  __inout  PWINDOWINFO pwi)
    attach_function 'GetWindowInfo', [:hwnd, :pointer], :bool

    #UINT WINAPI GetWindowModuleFileName(
    #  _In_   HWND hwnd,
    #  _Out_  LPTSTR lpszFileName,
    #  _In_   UINT cchFileNameMax )
    attach_function 'GetWindowModuleFileName',  [:hwnd, :string, :uint], :uint
    attach_function 'GetWindowModuleFileNameA', [:hwnd, :string, :uint], :uint
    attach_function 'GetWindowModuleFileNameW', [:hwnd, :string, :uint], :uint

    #BOOL GetWindowPlacement(
    #  __in     HWND             hWnd,
    #  __inout  WINDOWPLACEMENT *lpwndpl)
    attach_function 'GetWindowPlacement', [:hwnd, WINDOWPLACEMENT.ptr], :bool

    #BOOL GetWindowRect(
    #  __in   HWND   hWnd,
    #  __out  LPRECT lpRect)
    attach_function 'GetWindowRect', [:hwnd, RECT.ptr], :void

    #int WINAPI GetWindowText(
    #  _In_   HWND hWnd,
    #  _Out_  LPTSTR lpString,
    #  _In_   int nMaxCount )
    attach_function 'GetWindowTextA', [:hwnd, :pointer, :int], :int
    attach_function 'GetWindowTextW', [:hwnd, :pointer, :int], :int

    #int WINAPI GetWindowTextLength( _In_  HWND hWnd )
    attach_function 'GetWindowTextLengthA', [:hwnd], :int
    attach_function 'GetWindowTextLengthW', [:hwnd], :int

    #DWORD WINAPI GetWindowThreadProcessId(
    #  _In_       HWND hWnd,
    #  _Out_opt_  LPDWORD lpdwProcessId )
    attach_function 'GetWindowThreadProcessId', [:hwnd, :pointer], :dword

    #int WINAPI InternalGetWindowText(
    #  _In_   HWND hWnd,
    #  _Out_  LPWSTR lpString,
    #  _In_   int nMaxCount )
    attach_function 'InternalGetWindowText', [:hwnd, :string, :int], :int

    #BOOL WINAPI IsChild(
    #  _In_  HWND hWndParent,
    #  _In_  HWND hWnd )
    attach_function 'IsChild', [:hwnd, :hwnd], :bool

    #BOOL WINAPI IsHungAppWindow( _In_  HWND hWnd )
    attach_function 'IsHungAppWindow', [:hwnd], :bool

    #BOOL WINAPI IsIconic( _In_  HWND hWnd )
    attach_function 'IsIconic', [:hwnd], :bool

    #BOOL WINAPI IsWindow( _In_opt_  HWND hWnd )
    attach_function 'IsWindow', [:hwnd], :bool

    #BOOL WINAPI IsWindowUnicode( _In_  HWND hWnd )
    attach_function 'IsWindowUnicode', [:hwnd], :bool

    #BOOL WINAPI IsWindowVisible( _In_  HWND hWnd )
    attach_function 'IsWindowVisible', [:hwnd], :bool

    #BOOL WINAPI IsZoomed( _In_  HWND hWnd )
    attach_function 'IsZoomed', [:hwnd], :bool

    #BOOL WINAPI LockSetForegroundWindow( _In_  UINT uLockCode )
    attach_function 'LockSetForegroundWindow', [:uint], :bool

    #BOOL WINAPI MoveWindow(
    #  __in  HWND hWnd,
    #  __in  int  X,
    #  __in  int  Y,
    #  __in  int  nWidth,
    #  __in  int  nHeight,
    #  __in  BOOL bRepaint)
    attach_function 'MoveWindow', [:hwnd, :int, :int, :int, :int, :bool], :bool

    #BOOL WINAPI OpenIcon( _In_  HWND hWnd )
    attach_function 'OpenIcon', [:hwnd], :bool

    #HWND WINAPI RealChildWindowFromPoint(
    #  _In_  HWND hwndParent,
    #  _In_  POINT ptParentClientCoords )
    attach_function 'RealChildWindowFromPoint', [:hwnd, WinFFI::POINT], :hwnd

    #UINT WINAPI RealGetWindowClass(
    #  _In_   HWND hwnd,
    #  _Out_  LPTSTR pszType,
    #  _In_   UINT cchType )
    attach_function 'RealGetWindowClass', [:hwnd, :string, :uint], :uint
    attach_function 'RealGetWindowClassA', [:hwnd, :string, :uint], :uint
    attach_function 'RealGetWindowClassW', [:hwnd, :string, :uint], :uint

    #BOOL WINAPI RegisterShellHookWindow( _In_  HWND hWnd )
    attach_function 'RegisterShellHookWindow', [:hwnd], :bool

    #BOOL WINAPI SetForegroundWindow( _In_  HWND hWnd )
    attach_function 'SetForegroundWindow', [:hwnd], :bool

    #BOOL WINAPI SetLayeredWindowAttributes(
    #  _In_  HWND hwnd,
    #  _In_  COLORREF crKey,
    #  _In_  BYTE bAlpha,
    #  _In_  DWORD dwFlags )
    attach_function 'SetLayeredWindowAttributes', [:hwnd, :colorref, :byte, LayeredWindowAttributesFlags], :bool

    #HWND WINAPI SetParent(
    #  _In_      HWND hWndChild,
    #  _In_opt_  HWND hWndNewParent )
    attach_function 'SetParent', [:hwnd, :hwnd], :hwnd

    #BOOL WINAPI SetProcessDefaultLayout( _In_  DWORD dwDefaultLayout )
    attach_function 'SetProcessDefaultLayout', [:dword], :bool

    #BOOL WINAPI SetSysColors(
    #  _In_  int cElements,
    #  _In_  const INT *lpaElements,
    #  _In_  const COLORREF *lpaRgbValues )
    attach_function 'SetSysColors', [:int, :pointer, :pointer], :bool

    #BOOL WINAPI SetWindowPos(
    #  _In_      HWND hWnd,
    #  _In_opt_  HWND hWndInsertAfter,
    #  _In_      int X,
    #  _In_      int Y,
    #  _In_      int cx,
    #  _In_      int cy,
    #  _In_      UINT uFlags )
    attach_function 'SetWindowPos', [:hwnd, :hwnd, :int, :int, :int, :int, SetWindowPosFlags], :bool

    #BOOL SetWindowPlacement(
    #  __in     HWND             hWnd,
    #  __inout  WINDOWPLACEMENT *lpwndpl)
    attach_function 'SetWindowPlacement', [:hwnd, WINDOWPLACEMENT.ptr], :bool

    #BOOL WINAPI SetWindowText(
    #  __in      HWND    hWnd,
    #  __in_opt  LPCTSTR lpString)
    attach_function 'SetWindowTextA', [:hwnd, :string], :bool
    attach_function 'SetWindowTextW', [:hwnd, :string], :bool

    #BOOL WINAPI ShowOwnedPopups(
    #  _In_  HWND hWnd,
    #  _In_  BOOL fShow )
    attach_function 'ShowOwnedPopups', [:hwnd, :bool], :bool

    #BOOL ShowWindow(
    #  __in  HWND hWnd,
    #  __in  int  nCmdShow)
    attach_function 'ShowWindow', [:hwnd, ShowWindowFlags], :bool

    #BOOL WINAPI ShowWindowAsync(
    #  _In_  HWND hWnd,
    #  _In_  int nCmdShow )
    attach_function 'ShowWindowAsync', [:hwnd, :int], :bool

    # [This function is not intended for general use. It may be altered or unavailable in subsequent versions of Windows.]
    #VOID WINAPI SwitchToThisWindow(
    #  _In_  HWND hWnd,
    #  _In_  BOOL fAltTab )
    attach_function 'SwitchToThisWindow', [:hwnd, :bool], :void

    #WORD WINAPI TileWindows(
    #  _In_opt_  HWND hwndParent,
    #  _In_      UINT wHow,
    #  _In_opt_  const RECT *lpRect,
    #  _In_      UINT cKids,
    #  _In_opt_  const HWND *lpKids )
    attach_function 'TileWindows', [:hwnd, :uint, WinFFI::RECT.ptr, :uint, :pointer], :word

    #BOOL WINAPI UpdateLayeredWindow(
    #  _In_      HWND hwnd,
    #  _In_opt_  HDC hdcDst,
    #  _In_opt_  POINT *pptDst,
    #  _In_opt_  SIZE *psize,
    #  _In_opt_  HDC hdcSrc,
    #  _In_opt_  POINT *pptSrc,
    #  _In_      COLORREF crKey,
    #  _In_opt_  BLENDFUNCTION *pblend,
    #  _In_      DWORD dwFlags )
    attach_function 'UpdateLayeredWindow', [:hwnd, :hdc, WinFFI::POINT.ptr, WinFFI::SIZE.ptr, :hdc, WinFFI::POINT.ptr, :colorref, :pointer, LayeredWindowAttributesFlags], :bool

    #HWND WINAPI WindowFromPoint( _In_  POINT Point )
    attach_function 'WindowFromPoint', [WinFFI::POINT], :hwnd

    #int CALLBACK WinMain(
    #  _In_  HINSTANCE hInstance,
    #  _In_  HINSTANCE hPrevInstance,
    #  _In_  LPSTR lpCmdLine,
    #  _In_  int nCmdShow )
    callback 'WinMain', [:hinstance, :hinstance, :string, :int], :int

    if WindowsVersion >= :xp

      #BOOL WINAPI GetLayeredWindowAttributes(
      #  _In_       HWND hwnd,
      #  _Out_opt_  COLORREF *pcrKey,
      #  _Out_opt_  BYTE *pbAlpha,
      #  _Out_opt_  DWORD *pdwFlags )
      attach_function 'GetLayeredWindowAttributes', [:hwnd, :pointer, :pointer, :pointer], :bool

      #BOOL WINAPI IsGUIThread( _In_  BOOL bConvert )
      attach_function 'IsGUIThread', [:bool], :bool

      if WindowsVersion >= :vista

        #BOOL WINAPI ChangeWindowMessageFilter(
        #  _In_  UINT message,
        #  _In_  DWORD dwFlag )
        attach_function 'ChangeWindowMessageFilter', [:uint, MessageFilter], :bool

        #BOOL WINAPI GetWindowMinimizeRect (
        #  HWND hwndToQuery,
        #  RECT* pRect )
        attach_function 'GetWindowMinimizeRect', [:hwnd, WinFFI::RECT.ptr], :bool

        #BOOL WINAPI IsProcessDPIAware(void)
        attach_function 'IsProcessDPIAware', [], :bool

        #BOOL WINAPI LogicalToPhysicalPoint(
        #  _In_     HWND hWnd,
        #  _Inout_  LPPOINT lpPoint )
        attach_function 'LogicalToPhysicalPoint', [:hwnd, WinFFI::POINT.ptr], :bool

        #BOOL WINAPI PhysicalToLogicalPoint(
        #  _In_     HWND hWnd,
        #  _Inout_  LPPOINT lpPoint )
        attach_function 'PhysicalToLogicalPoint', [:hwnd, WinFFI::POINT.ptr], :bool

        #BOOL WINAPI SetProcessDPIAware(void)
        attach_function 'SetProcessDPIAware', [], :bool

        #BOOL WINAPI SoundSentry(void)
        attach_function 'SoundSentry', [], :bool

        #BOOL WINAPI UpdateLayeredWindowIndirect(
        #  _In_  HWND hwnd,
        #  _In_  const UPDATELAYEREDWINDOWINFO *pULWInfo )
        attach_function 'UpdateLayeredWindowIndirect', [:hwnd, UPDATELAYEREDWINDOWINFO.ptr], :bool

        #HWND WINAPI WindowFromPhysicalPoint( _In_  POINT Point )
        attach_function 'WindowFromPhysicalPoint', [WinFFI::POINT], :hwnd

        if WindowsVersion >= 7

          #BOOL WINAPI CalculatePopupWindowPosition(
          #  _In_      const POINT *anchorPoint,
          #  _In_      const SIZE *windowSize,
          #  _In_      UINT flags,
          #  _In_opt_  RECT *excludeRect,
          #  _Out_     RECT *popupWindowPosition )
          attach_function 'CalculatePopupWindowPosition', [:pointer, :pointer, TrackPopupMenuFlags, RECT.ptr, RECT.ptr], :bool

          #BOOL WINAPI ChangeWindowMessageFilterEx(
          #  _In_         HWND hWnd,
          #  _In_         UINT message,
          #  _In_         DWORD action,
          #  _Inout_opt_  PCHANGEFILTERSTRUCT pChangeFilterStruct )
          attach_function 'ChangeWindowMessageFilterEx', [:hwnd, :uint, :dword, :pointer], :bool

          #BOOL WINAPI GetWindowDisplayAffinity(
          #  _In_   HWND hWnd,
          #  _Out_  DWORD *dwAffinity )
          attach_function 'GetWindowDisplayAffinity', [:hwnd, :pointer], :bool

          #BOOL WINAPI SetWindowDisplayAffinity(
          #  _In_  HWND hWnd,
          #  _In_  DWORD dwAffinity )
          attach_function 'SetWindowDisplayAffinity', [:hwnd, :dword], :bool

          if WindowsVersion >= 8.1

            #HRESULT WINAPI GetProcessDPIAwareness(
            #  _In_   HANDLE hprocess,
            #  _Out_  PROCESS_DPI_AWARENESS *value )
            # attach_function 'GetProcessDPIAwareness', [:handle, :pointer], :hresult

            #HRESULT WINAPI SetProcessDPIAwareness(
            #  _In_  PROCESS_DPI_AWARENESS value )
            # attach_function 'SetProcessDPIAwareness', [:pointer], :hresult
          end
        end
      end
    end
  end
end