require 'win-ffi/functions/user32'

require 'win-ffi/structs/rect'
require 'win-ffi/structs/user32/draw_text_params'

module WinFFI
  module User32
    #int DrawText(
    #  _In_     HDC hDC,
    #  _Inout_  LPCTSTR lpchText,
    #  _In_     int nCount,
    #  _Inout_  LPRECT lpRect,
    #  _In_     UINT uFormat )
    attach_function 'DrawTextA', [:hdc, :string, :int, RECT.ptr, :uint], :int
    attach_function 'DrawTextW', [:hdc, :string, :int, RECT.ptr, :uint], :int

    #int DrawTextEx(
    #  _In_     HDC hdc,
    #  _Inout_  LPTSTR lpchText,
    #  _In_     int cchText,
    #  _Inout_  LPRECT lprc,
    #  _In_     UINT dwDTFormat,
    #  _In_     LPDRAWTEXTPARAMS lpDTParams )
    attach_function 'DrawTextExA', [:hdc, :string, :int, RECT.ptr, :uint, DRAWTEXTPARAMS.ptr], :int
    attach_function 'DrawTextExW', [:hdc, :string, :int, RECT.ptr, :uint, DRAWTEXTPARAMS.ptr], :int

    #DWORD GetTabbedTextExtent(
    #  _In_  HDC hDC,
    #  _In_  LPCTSTR lpString,
    #  _In_  int nCount,
    #  _In_  int nTabPositions,
    #  _In_  const LPINT lpnTabStopPositions )
    attach_function 'GetTabbedTextExtentA', [:hdc, :string, :int, :int, :pointer], :dword
    attach_function 'GetTabbedTextExtentW', [:hdc, :string, :int, :int, :pointer], :dword

    #LONG TabbedTextOut(
    #  _In_  HDC hDC,
    #  _In_  int X,
    #  _In_  int Y,
    #  _In_  LPCTSTR lpString,
    #  _In_  int nCount,
    #  _In_  int nTabPositions,
    #  _In_  const LPINT lpnTabStopPositions,
    #  _In_  int nTabOrigin )
    attach_function 'TabbedTextOutA', [:hdc, :int, :int, :string, :int, :int, :pointer, :int], :long
    attach_function 'TabbedTextOutW', [:hdc, :int, :int, :string, :int, :int, :pointer, :int], :long
  end
end