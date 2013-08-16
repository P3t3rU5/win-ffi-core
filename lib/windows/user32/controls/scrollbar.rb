module WinFFI
  module User32
    module Control
      module ScrollBar
        extend LibBase

        ffi_lib 'user32'

        class SCROLLBARINFO < FFI::Struct
          layout :cbSize,        :dword,
                 :rcScrollBar,   RECT,
                 :dxyLineButton, :int,
                 :xyThumbTop,    :int,
                 :xyThumbBottom, :int,
                 :reserved,      :int,
                 :rgstate,       :dword
        end

        class SCROLLINFO < FFI::Struct
          layout :cbSize,    :uint,
                 :fMask,     :uint,
                 :nMin,      :int,
                 :nMax,      :int,
                 :nPage,     :uint,
                 :nPos,      :int,
                 :nTrackPos, :int
        end

        #BOOL EnableScrollBar(
        #  _In_  HWND hWnd,
        #  _In_  UINT wSBflags,
        #  _In_  UINT wArrows )
        attach_function 'EnableScrollBar', [:hwnd, :uint, :uint], :bool

        #BOOL GetScrollBarInfo(
        #  _In_   HWND hwnd,
        #  _In_   LONG idObject,
        #  _Out_  PSCROLLBARINFO psbi )
        attach_function 'GetScrollBarInfo', [:hwnd, :long, SCROLLBARINFO.ptr], :bool

        #BOOL GetScrollInfo(
        #  _In_     HWND hwnd,
        #  _In_     int fnBar,
        #  _Inout_  LPSCROLLINFO lpsi )
        attach_function 'GetScrollInfo', [:hwnd, :int, SCROLLINFO.ptr], :bool

        #int GetScrollPos(
        #  _In_  HWND hWnd,
        #  _In_  int nBar )
        attach_function 'GetScrollPos', [:hwnd, :int], :int

        #BOOL GetScrollRange(
        #  _In_   HWND hWnd,
        #  _In_   int nBar,
        #  _Out_  LPINT lpMinPos,
        #  _Out_  LPINT lpMaxPos )
        attach_function 'GetScrollRange', [:hwnd, :int, :pointer, :pointer], :bool

        #BOOL ScrollDC(
        #  _In_   HDC hDC,
        #  _In_   int dx,
        #  _In_   int dy,
        #  _In_   const RECT *lprcScroll,
        #  _In_   const RECT *lprcClip,
        #  _In_   HRGN hrgnUpdate,
        #  _Out_  LPRECT lprcUpdate )
        attach_function 'ScrollDC', [:hdc, :int, :int, RECT.ptr, RECT.ptr, :hrgn, RECT.ptr], :bool

        #BOOL ScrollWindow(
        #  _In_  HWND hWnd,
        #  _In_  int XAmount,
        #  _In_  int YAmount,
        #  _In_  const RECT *lpRect,
        #  _In_  const RECT *lpClipRect )
        attach_function 'ScrollWindow', [:hwnd, :int, :int, RECT.ptr, RECT.ptr], :bool

        #int ScrollWindowEx(
        #  _In_   HWND hWnd,
        #  _In_   int dx,
        #  _In_   int dy,
        #  _In_   const RECT *prcScroll,
        #  _In_   const RECT *prcClip,
        #  _In_   HRGN hrgnUpdate,
        #  _Out_  LPRECT prcUpdate,
        #  _In_   UINT flags )
        attach_function 'ScrollWindowEx', [:hwnd, :int, :int, RECT.ptr, RECT.ptr, :hrgn, RECT.ptr, :uint], :int

        #int SetScrollInfo(
        #  _In_  HWND hwnd,
        #  _In_  int fnBar,
        #  _In_  LPCSCROLLINFO lpsi,
        #  _In_  BOOL fRedraw )
        attach_function 'SetScrollInfo', [:hwnd, :int, SCROLLINFO.ptr, :bool], :int

        #int SetScrollPos(
        #  _In_  HWND hWnd,
        #  _In_  int nBar,
        #  _In_  int nPos,
        #  _In_  BOOL bRedraw )
        attach_function 'SetScrollPos', [:hwnd, :int, :int, :bool], :int

        #BOOL SetScrollRange(
        #  _In_  HWND hWnd,
        #  _In_  int nBar,
        #  _In_  int nMinPos,
        #  _In_  int nMaxPos,
        #  _In_  BOOL bRedraw )
        attach_function 'SetScrollRange', [:hwnd, :int, :int, :int, :bool], :bool

        #BOOL ShowScrollBar(
        #  _In_  HWND hWnd,
        #  _In_  int wBar,
        #  _In_  BOOL bShow )
        attach_function 'ShowScrollBar', [:hwnd, :int, :bool], :bool
      end
    end
  end
end