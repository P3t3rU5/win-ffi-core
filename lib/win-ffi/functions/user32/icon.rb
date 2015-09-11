require 'win-ffi/functions/user32'

require 'win-ffi/enums/lr'

require 'win-ffi/structs/user32/icon_info'
require 'win-ffi/structs/user32/icon_info_ex'

module WinFFI
  module User32
    #HICON WINAPI CopyIcon( _In_  HICON hIcon )
    attach_function 'CopyIcon', [:hicon], :hicon

    #HICON WINAPI CreateIcon(
    #  _In_opt_  HINSTANCE hInstance,
    #  _In_      int nWidth,
    #  _In_      int nHeight,
    #  _In_      BYTE cPlanes,
    #  _In_      BYTE cBitsPixel,
    #  _In_      const BYTE *lpbANDbits,
    #  _In_      const BYTE *lpbXORbits )
    attach_function 'CreateIcon' , [:hinstance, :int, :int, :byte, :byte, :pointer, :pointer], :hicon

    #HICON WINAPI CreateIconFromResource(
    #  _In_  PBYTE presbits,
    #  _In_  DWORD dwResSize,
    #  _In_  BOOL fIcon,
    #  _In_  DWORD dwVer )
    attach_function 'CreateIconFromResource', [:pointer, :dword, :bool, :dword], :hicon

    #HICON WINAPI CreateIconFromResourceEx(
    #  _In_  PBYTE pbIconBits,
    #  _In_  DWORD cbIconBits,
    #  _In_  BOOL fIcon,
    #  _In_  DWORD dwVersion,
    #  _In_  int cxDesired,
    #  _In_  int cyDesired,
    #  _In_  UINT uFlags )
    attach_function 'CreateIconFromResourceEx', [:pointer, :dword, :bool, :dword, :int, :int, :uint], :hicon

    #HICON WINAPI CreateIconIndirect( _In_  PICONINFO piconinfo )
    attach_function 'CreateIconIndirect',  [:pointer], :hicon

    #BOOL WINAPI DrawIcon(
    #  _In_  HDC hDC,
    #  _In_  int X,
    #  _In_  int Y,
    #  _In_  HICON hIcon )
    attach_function 'DrawIcon', [:hdc, :int, :int, :hicon], :bool

    #BOOL WINAPI DestroyIcon( _In_  HICON hIcon )
    attach_function 'DestroyIcon', [:hicon], :bool

    #BOOL WINAPI DrawIconEx(
    #  _In_      HDC hdc,
    #  _In_      int xLeft,
    #  _In_      int yTop,
    #  _In_      HICON hIcon,
    #  _In_      int cxWidth,
    #  _In_      int cyWidth,
    #  _In_      UINT istepIfAniCur,
    #  _In_opt_  HBRUSH hbrFlickerFreeDraw,
    #  _In_      UINT diFlags )
    attach_function 'DrawIconEx', [:hdc, :int, :int, :hicon, :int, :int, :uint, :hbrush, :uint], :bool

    #BOOL WINAPI GetIconInfo(
    #  _In_   HICON hIcon,
    #  _Out_  PICONINFO piconinfo )
    attach_function 'GetIconInfo', [:hicon, ICONINFO.ptr], :bool

    if WindowsVersion >= :vista

      #BOOL WINAPI GetIconInfoEx(
      #  _In_     HICON hIcon,
      #  _Inout_  PICONINFOEX piconinfoex )
      attach_function 'GetIconInfoExA', [:hicon, ICONINFOEX.ptr], :bool
      attach_function 'GetIconInfoExW', [:hicon, ICONINFOEX.ptr], :bool
    end

    #HICON LoadIcon(
    #  __in_opt  HINSTANCE hInstance,
    #  __in      LPCTSTR   lpIconName)
    attach_function 'LoadIconA', [:hinstance, :pointer], :hicon
    attach_function 'LoadIconW', [:hinstance, :pointer], :hicon

    #int WINAPI LookupIconIdFromDirectory(
    #  _In_  PBYTE presbits,
    #  _In_  BOOL fIcon )
    attach_function 'LookupIconIdFromDirectory', [:pointer, :bool], :int

    #int WINAPI LookupIconIdFromDirectoryEx(
    #  _In_  PBYTE presbits,
    #  _In_  BOOL fIcon,
    #  _In_  int cxDesired,
    #  _In_  int cyDesired,
    #  _In_  UINT Flags )
    attach_function 'LookupIconIdFromDirectoryEx', [:pointer, :bool, :int, :int, LR], :int
  end
end
