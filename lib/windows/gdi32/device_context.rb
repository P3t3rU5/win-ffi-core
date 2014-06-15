module WinFFI
  module Gdi32
    module DeviceContext
      extend LibBase

      ffi_lib 'gdi32'

      DRIVERVERSION = 0
      TECHNOLOGY    = 2
      HORZSIZE      = 4
      VERTSIZE      = 6
      HORZRES       = 8
      VERTRES       = 10
      BITSPIXEL     = 12
      PLANES        = 14
      NUMBRUSHES    = 16
      NUMPENS       = 18
      NUMMARKERS    = 20
      NUMFONTS      = 22
      NUMCOLORS     = 24
      PDEVICESIZE   = 26
      CURVECAPS     = 28
      LINECAPS      = 30
      POLYGONALCAPS = 32
      TEXTCAPS      = 34
      CLIPCAPS      = 36
      RASTERCAPS    = 38
      ASPECTX       = 40
      ASPECTY       = 42
      ASPECTXY      = 44

      class DISPLAY_DEVICE < FFI::Struct
        #TODO
        #typedef struct _DISPLAY_DEVICE {
        #  DWORD cb
        #  TCHAR DeviceName[32]
        #  TCHAR DeviceString[128]
        #  DWORD StateFlags
        #  TCHAR DeviceID[128]
        #  TCHAR DeviceKey[128] }
        layout :cb,             :dword,
               :DeviceName,     :string,
               :DeviceString,   :string,
               :StateFlags,     :dword,
               :DeviceID,       :string,
               :DeviceKey,      :string
      end

      #BOOL CancelDC( _In_  HDC hdc )
      attach_function 'CancelDC', [:hdc], :bool

      #HDC CreateCompatibleDC( _In_  HDC hdc )
      attach_function 'CreateCompatibleDC', [:hdc], :hdc

      #HDC CreateDC(
      #  LPCTSTR lpszDriver,
      #  _In_  LPCTSTR lpszDevice,
      #  LPCTSTR lpszOutput,
      #  _In_  const DEVMODE *lpInitData )
      attach_function 'CreateDCA', [:string, :string, :pointer, :pointer], :hdc
      attach_function 'CreateDCW', [:string, :string, :pointer, :pointer], :hdc

      #HDC CreateIC(
      #  _In_  LPCTSTR lpszDriver,
      #  _In_  LPCTSTR lpszDevice,
      #  LPCTSTR lpszOutput,
      #  _In_  const DEVMODE *lpdvmInit )
      attach_function 'CreateICA', [:string, :string, :pointer, :pointer], :hdc
      attach_function 'CreateICW', [:string, :string, :pointer, :pointer], :hdc

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
      attach_function 'GetObjectA', [:hgdiobj, :int, :pointer], :int
      attach_function 'GetObjectW', [:hgdiobj, :int, :pointer], :int

      #DWORD GetObjectType( _In_  HGDIOBJ h )
      attach_function 'GetObjectType', [:hgdiobj], :dword

      #HGDIOBJ GetStockObject( _In_  int fnObject )
      attach_function 'GetStockObject', [:int], :hgdiobj

      #HDC ResetDC(
      #  _In_  HDC hdc,
      #  _In_  const DEVMODE *lpInitData )
      attach_function 'ResetDCA', [:hdc, :pointer], :hdc
      attach_function 'ResetDCW', [:hdc, :pointer], :hdc

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

      ffi_lib 'user32'

      #LONG ChangeDisplaySettings(
      #  _In_  DEVMODE *lpDevMode,
      #  _In_  DWORD dwflags )
      attach_function 'ChangeDisplaySettingsA', [:pointer, :dword], :long
      attach_function 'ChangeDisplaySettingsW', [:pointer, :dword], :long

      #LONG ChangeDisplaySettingsEx(
      #  _In_  LPCTSTR lpszDeviceName,
      #  _In_  DEVMODE *lpDevMode,
      #  HWND hwnd,
      #  _In_  DWORD dwflags,
      #  _In_  LPVOID lParam )
      attach_function 'ChangeDisplaySettingsExA', [:string, :pointer, :hwnd, :dword, :pointer], :long
      attach_function 'ChangeDisplaySettingsExW', [:string, :pointer, :hwnd, :dword, :pointer], :long

      ffi_lib 'user32'

      #BOOL EnumDisplayDevices(
      #  _In_   LPCTSTR lpDevice,
      #  _In_   DWORD iDevNum,
      #  _Out_  PDISPLAY_DEVICE lpDisplayDevice,
      #  _In_   DWORD dwFlags )
      attach_function 'EnumDisplayDevicesA', [:pointer, :dword, DISPLAY_DEVICE.ptr, :dword], :bool
      attach_function 'EnumDisplayDevicesW', [:pointer, :dword, DISPLAY_DEVICE.ptr, :dword], :bool

      #BOOL EnumDisplaySettings(
      #  _In_   LPCTSTR lpszDeviceName,
      #  _In_   DWORD iModeNum,
      #  _Out_  DEVMODE *lpDevMode )
      attach_function 'EnumDisplaySettingsA', [:string, :dword, :pointer], :bool
      attach_function 'EnumDisplaySettingsW', [:string, :dword, :pointer], :bool

      #BOOL EnumDisplaySettingsEx(
      #  _In_   LPCTSTR lpszDeviceName,
      #  _In_   DWORD iModeNum,
      #  _Out_  DEVMODE *lpDevMode,
      #  _In_   DWORD dwFlags )
      attach_function 'EnumDisplaySettingsExA', [:string, :dword, :pointer, :dword], :bool
      attach_function 'EnumDisplaySettingsExW', [:string, :dword, :pointer, :dword], :bool

      #HDC GetDC( _In_  HWND hWnd )
      attach_function 'GetDC', [:hwnd], :hdc

      #HDC GetDCEx(
      #  _In_  HWND hWnd,
      #  _In_  HRGN hrgnClip,
      #  _In_  DWORD flags )
      attach_function 'GetDCEx', [:hwnd, :hrgn, :dword], :hdc

      #int ReleaseDC(
      #  _In_  HWND hWnd,
      #  _In_  HDC hDC )
      attach_function 'ReleaseDC', [:hwnd, :hdc], :int

      #HWND WindowFromDC( _In_  HDC hDC )
      attach_function 'WindowFromDC', [:hdc], :hwnd

    end
  end
end