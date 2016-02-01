require 'win-ffi/user32'

module WinFFI
  module User32
    if WindowsVersion >= :vista
      require 'win-ffi/user32/enum/window/control/enable_scrollbar_flags'
      require 'win-ffi/user32/enum/window/control/scrollbar'
      require 'win-ffi/user32/enum/window/control/scroll_window_flags'

      require 'win-ffi/user32/struct/window/control/scrollbar/scrollbar_info'
      require 'win-ffi/user32/struct/window/control/scrollbar/scroll_info'

      # https://msdn.microsoft.com/en-us/library/windows/desktop/bb787579(v=vs.85).aspx
      # BOOL EnableScrollBar(
      #   _In_  HWND hWnd,
      #   _In_  UINT wSBflags,
      #   _In_  UINT wArrows )
      attach_function 'EnableScrollBar', [:hwnd, Scrollbar, EnableScrollBarFlags], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/bb787581(v=vs.85).aspx
      # BOOL GetScrollBarInfo(
      #   _In_   HWND hwnd,
      #   _In_   LONG idObject,
      #   _Out_  PSCROLLBARINFO psbi )
      attach_function 'GetScrollBarInfo', [:hwnd, SystemObjectId, SCROLLBARINFO.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/bb787583(v=vs.85).aspx
      # BOOL GetScrollInfo(
      #  _In_     HWND hwnd,
      #  _In_     int fnBar,
      #  _Inout_  LPSCROLLINFO lpsi )
      attach_function 'GetScrollInfo', [:hwnd, Scrollbar, SCROLLINFO.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/bb787585(v=vs.85).aspx
      # int GetScrollPos(
      #   _In_  HWND hWnd,
      #   _In_  int nBar )
      attach_function 'GetScrollPos', [:hwnd, Scrollbar], :int

      # https://msdn.microsoft.com/en-us/library/windows/desktop/bb787587(v=vs.85).aspx
      # BOOL GetScrollRange(
      #   _In_   HWND hWnd,
      #   _In_   int nBar,
      #   _Out_  LPINT lpMinPos,
      #   _Out_  LPINT lpMaxPos )
      attach_function 'GetScrollRange', [:hwnd, Scrollbar, :pointer, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/bb787589(v=vs.85).aspx
      # BOOL ScrollDC(
      #   _In_   HDC hDC,
      #   _In_   int dx,
      #   _In_   int dy,
      #   _In_   const RECT *lprcScroll,
      #   _In_   const RECT *lprcClip,
      #   _In_   HRGN hrgnUpdate,
      #   _Out_  LPRECT lprcUpdate )
      attach_function 'ScrollDC', [:hdc, :int, :int, RECT.ptr, RECT.ptr, :hrgn, RECT.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/bb787591(v=vs.85).aspx
      # BOOL ScrollWindow(
      #   _In_  HWND hWnd,
      #   _In_  int XAmount,
      #   _In_  int YAmount,
      #   _In_  const RECT *lpRect,
      #   _In_  const RECT *lpClipRect )
      attach_function 'ScrollWindow', [:hwnd, :int, :int, RECT.ptr, RECT.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/bb787593(v=vs.85).aspx
      # int ScrollWindowEx(
      #   _In_   HWND hWnd,
      #   _In_   int dx,
      #   _In_   int dy,
      #   _In_   const RECT *prcScroll,
      #   _In_   const RECT *prcClip,
      #   _In_   HRGN hrgnUpdate,
      #   _Out_  LPRECT prcUpdate,
      #   _In_   UINT flags )
      attach_function 'ScrollWindowEx', [:hwnd, :int, :int, RECT.ptr, RECT.ptr, :hrgn, RECT.ptr, ScrollWindowFlags], :int

      # https://msdn.microsoft.com/en-us/library/windows/desktop/bb787595(v=vs.85).aspx
      # int SetScrollInfo(
      #   _In_  HWND hwnd,
      #   _In_  int fnBar,
      #   _In_  LPCSCROLLINFO lpsi,
      #   _In_  BOOL fRedraw )
      attach_function 'SetScrollInfo', [:hwnd, Scrollbar, SCROLLINFO.ptr, :bool], :int

      # https://msdn.microsoft.com/en-us/library/windows/desktop/bb787595(v=vs.85).aspx
      # int SetScrollPos(
      #   _In_  HWND hWnd,
      #   _In_  int nBar,
      #   _In_  int nPos,
      #   _In_  BOOL bRedraw )
      attach_function 'SetScrollPos', [:hwnd, Scrollbar, :int, :bool], :int

      # https://msdn.microsoft.com/en-us/library/windows/desktop/bb787599(v=vs.85).aspx
      # BOOL SetScrollRange(
      #   _In_  HWND hWnd,
      #   _In_  int nBar,
      #   _In_  int nMinPos,
      #   _In_  int nMaxPos,
      #   _In_  BOOL bRedraw )
      attach_function 'SetScrollRange', [:hwnd, Scrollbar, :int, :int, :bool], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/bb787601(v=vs.85).aspx
      # BOOL ShowScrollBar(
      #   _In_  HWND hWnd,
      #   _In_  int wBar,
      #   _In_  BOOL bShow )
      attach_function 'ShowScrollBar', [:hwnd, Scrollbar, :bool], :bool
    end
  end
end