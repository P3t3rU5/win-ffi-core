require 'win-ffi/gdi32'

require 'win-ffi/general/struct/point'

module WinFFI
  module Gdi32

    typedef :pointer, :hgdiobj

    #BOOL CancelDC( _In_  HDC hdc )
    attach_function 'CancelDC', [:hdc], :bool

    #HDC CreateCompatibleDC( _In_  HDC hdc )
    attach_function 'CreateCompatibleDC', [:hdc], :hdc

    #HDC CreateDC(
    #  LPCTSTR lpszDriver,
    #  _In_  LPCTSTR lpszDevice,
    #  LPCTSTR lpszOutput,
    #  _In_  const DEVMODE *lpInitData )
    encoded_function 'CreateDC', [:string, :string, :pointer, :pointer], :hdc

    #HDC CreateIC(
    #  _In_  LPCTSTR lpszDriver,
    #  _In_  LPCTSTR lpszDevice,
    #  LPCTSTR lpszOutput,
    #  _In_  const DEVMODE *lpdvmInit )
    encoded_function 'CreateIC', [:string, :string, :pointer, :pointer], :hdc

    #BOOL DeleteDC( _In_  HDC hdc )
    attach_function 'DeleteDC', [:hdc], :bool

    #BOOL DeleteObject( _In_  HGDIOBJ hObject )
    attach_function 'DeleteObject', [:hgdiobj], :bool

    #int DrawEscape(
    #  _In_  HDC hdc,
    #  _In_  int nEscape,
    #  _In_  int cbInput,
    #  _In_  LPCSTR lpszInData )
    attach_function 'DrawEscape', [:hdc, :int, :int, :pointer], :int

    #TODO
    #int EnumObjects(
    #  _In_  HDC hdc,
    #  _In_  int nObjectType,
    #  _In_  GOBJENUMPROC lpObjectFunc,
    #  _In_  LPARAM lParam )
    attach_function 'EnumObjects', [:hdc, :int, :pointer, :lparam], :int

    #int CALLBACK EnumObjectsProc(
    #  _In_  LPVOID lpLogObject,
    #  _In_  LPARAM lpData )
    callback 'EnumObjectsProc', [:pointer, :lparam], :int

    #HGDIOBJ GetCurrentObject(
    #  _In_  HDC hdc,
    #  _In_  UINT uObjectType )
    attach_function 'GetCurrentObject', [:hdc, :uint], :hgdiobj

    #COLORREF GetDCBrushColor( _In_  HDC hdc )
    attach_function 'GetDCBrushColor', [:hdc], :colorref

    #BOOL GetDCOrgEx(
    #  _In_   HDC hdc,
    #  _Out_  LPPOINT lpPoint )
    attach_function 'GetDCOrgEx', [:hdc, POINT.ptr], :bool

    #COLORREF GetDCPenColor( _In_  HDC hdc )
    attach_function 'GetDCPenColor', [:hdc], :colorref

    #int GetDeviceCaps(
    #  _In_  HDC hdc,
    #  _In_  int nIndex )
    attach_function 'GetDeviceCaps', [:hdc, :int], :int

    #DWORD GetLayout( _In_  HDC hdc )
    attach_function 'GetLayout', [:hdc], :dword

    #int GetObject(
    #  _In_   HGDIOBJ hgdiobj,
    #  _In_   int cbBuffer,
    #  _Out_  LPVOID lpvObject )
    encoded_function 'GetObject', [:hgdiobj, :int, :pointer], :int

    #DWORD GetObjectType( _In_  HGDIOBJ h )
    attach_function 'GetObjectType', [:hgdiobj], :dword

    #HGDIOBJ GetStockObject( _In_  int fnObject )
    attach_function 'GetStockObject', [:int], :hgdiobj

    #HDC ResetDC(
    #  _In_  HDC hdc,
    #  _In_  const DEVMODE *lpInitData )
    encoded_function 'ResetDC', [:hdc, :pointer], :hdc

    #BOOL RestoreDC(
    #  _In_  HDC hdc,
    #  _In_  int nSavedDC )
    attach_function 'RestoreDC', [:hdc, :int], :bool

    #int SaveDC( _In_  HDC hdc )
    attach_function 'SaveDC', [:hdc], :int

    #HGDIOBJ SelectObject(
    #  _In_  HDC hdc,
    #  _In_  HGDIOBJ hgdiobj )
    attach_function 'SelectObject', [:hdc, :hgdiobj], :hgdiobj

    #COLORREF SetDCBrushColor(
    #  _In_  HDC hdc,
    #  _In_  COLORREF crColor )
    attach_function 'SetDCBrushColor', [:hdc, :colorref], :colorref

    #COLORREF SetDCPenColor(
    #  _In_  HDC hdc,
    #  _In_  COLORREF crColor )
    attach_function 'SetDCPenColor', [:hdc, :colorref], :colorref

    #DWORD SetLayout(
    #  _In_  HDC hdc,
    #  _In_  DWORD dwLayout )
    attach_function 'SetLayout', [:hdc, :dword], :dword
  end
end