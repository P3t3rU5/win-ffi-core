require 'win-ffi/user32'

require 'win-ffi/general/struct/rect'
require 'win-ffi/user32/struct/draw_text_params'

module WinFFI
  module User32
    #int DrawText(
    #  _In_     HDC hDC,
    #  _Inout_  LPCTSTR lpchText,
    #  _In_     int nCount,
    #  _Inout_  LPRECT lpRect,
    #  _In_     UINT uFormat )
    encoded_function 'DrawText', [:hdc, :string, :int, RECT.ptr, :uint], :int

    #int DrawTextEx(
    #  _In_     HDC hdc,
    #  _Inout_  LPTSTR lpchText,
    #  _In_     int cchText,
    #  _Inout_  LPRECT lprc,
    #  _In_     UINT dwDTFormat,
    #  _In_     LPDRAWTEXTPARAMS lpDTParams )
    encoded_function 'DrawTextEx', [:hdc, :string, :int, RECT.ptr, :uint, DRAWTEXTPARAMS.ptr], :int

    #DWORD GetTabbedTextExtent(
    #  _In_  HDC hDC,
    #  _In_  LPCTSTR lpString,
    #  _In_  int nCount,
    #  _In_  int nTabPositions,
    #  _In_  const LPINT lpnTabStopPositions )
    encoded_function 'GetTabbedTextExtent', [:hdc, :string, :int, :int, :pointer], :dword

    #LONG TabbedTextOut(
    #  _In_  HDC hDC,
    #  _In_  int X,
    #  _In_  int Y,
    #  _In_  LPCTSTR lpString,
    #  _In_  int nCount,
    #  _In_  int nTabPositions,
    #  _In_  const LPINT lpnTabStopPositions,
    #  _In_  int nTabOrigin )
    encoded_function 'TabbedTextOut', [:hdc, :int, :int, :string, :int, :int, :pointer, :int], :long
  end
end