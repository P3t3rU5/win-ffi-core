require 'win-ffi/user32'

require 'win-ffi/general/enum/load_resource_flags'

require 'win-ffi/user32/struct/resource/icon/icon_info'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648058(v=vs.85).aspx
    # HICON WINAPI CopyIcon( _In_  HICON hIcon )
    attach_function 'CopyIcon', [:hicon], :hicon

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648059(v=vs.85).aspx
    # HICON WINAPI CreateIcon(
    #   _In_opt_  HINSTANCE hInstance,
    #   _In_      int nWidth,
    #   _In_      int nHeight,
    #   _In_      BYTE cPlanes,
    #   _In_      BYTE cBitsPixel,
    #   _In_      const BYTE *lpbANDbits,
    #   _In_      const BYTE *lpbXORbits )
    attach_function 'CreateIcon' , [:hinstance, :int, :int, :byte, :byte, :pointer, :pointer], :hicon

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648060(v=vs.85).aspx
    # HICON WINAPI CreateIconFromResource(
    #   _In_  PBYTE presbits,
    #   _In_  DWORD dwResSize,
    #   _In_  BOOL fIcon,
    #   _In_  DWORD dwVer )
    attach_function 'CreateIconFromResource', [:pointer, :dword, :bool, :dword], :hicon

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648061(v=vs.85).aspx
    # HICON WINAPI CreateIconFromResourceEx(
    #   _In_  PBYTE pbIconBits,
    #   _In_  DWORD cbIconBits,
    #   _In_  BOOL fIcon,
    #   _In_  DWORD dwVersion,
    #   _In_  int cxDesired,
    #   _In_  int cyDesired,
    #   _In_  UINT uFlags )
    attach_function 'CreateIconFromResourceEx', [:pointer, :dword, :bool, :dword, :int, :int, LoadResourceFlags], :hicon

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648062(v=vs.85).aspx
    # HICON WINAPI CreateIconIndirect( _In_  PICONINFO piconinfo )
    attach_function 'CreateIconIndirect',  [ICONINFO.ptr], :hicon

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648063(v=vs.85).aspx
    # BOOL WINAPI DestroyIcon( _In_  HICON hIcon )
    attach_function 'DestroyIcon', [:hicon], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648064(v=vs.85).aspx
    # BOOL WINAPI DrawIcon(
    #   _In_  HDC hDC,
    #   _In_  int X,
    #   _In_  int Y,
    #   _In_  HICON hIcon )
    attach_function 'DrawIcon', [:hdc, :int, :int, :hicon], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648065(v=vs.85).aspx
    # BOOL WINAPI DrawIconEx(
    #   _In_      HDC hdc,
    #   _In_      int xLeft,
    #   _In_      int yTop,
    #   _In_      HICON hIcon,
    #   _In_      int cxWidth,
    #   _In_      int cyWidth,
    #   _In_      UINT istepIfAniCur,
    #   _In_opt_  HBRUSH hbrFlickerFreeDraw,
    #   _In_      UINT diFlags )
    attach_function 'DrawIconEx', [:hdc, :int, :int, :hicon, :int, :int, :uint, :hbrush, DrawIconExFlag], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648070(v=vs.85).aspx
    # BOOL WINAPI GetIconInfo(
    #   _In_   HICON hIcon,
    #   _Out_  PICONINFO piconinfo )
    attach_function 'GetIconInfo', [:hicon, ICONINFO.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648072(v=vs.85).aspx
    # HICON LoadIcon(
    #   __in_opt  HINSTANCE hInstance,
    #   __in      LPCTSTR   lpIconName)
    encoded_function 'LoadIcon', [:hinstance, :pointer], :hicon

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648073(v=vs.85).aspx
    # int WINAPI LookupIconIdFromDirectory(
    #   _In_  PBYTE presbits,
    #   _In_  BOOL fIcon )
    attach_function 'LookupIconIdFromDirectory', [:pointer, :bool], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648074(v=vs.85).aspx
    # int WINAPI LookupIconIdFromDirectoryEx(
    #   _In_  PBYTE presbits,
    #   _In_  BOOL fIcon,
    #   _In_  int cxDesired,
    #   _In_  int cyDesired,
    #   _In_  UINT Flags )
    attach_function 'LookupIconIdFromDirectoryEx', [:pointer, :bool, :int, :int, LoadResourceFlags], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648075(v=vs.85).aspx
    # This function is not intended for general use. It may be altered or unavailable in subsequent versions of Windows.
    # UINT WINAPI PrivateExtractIcons(
    #   _In_       LPCTSTR lpszFile,
    #   _In_       int nIconIndex,
    #   _In_       int cxIcon,
    #   _In_       int cyIcon,
    #   _Out_opt_  HICON *phicon,
    #   _Out_opt_  UINT *piconid,
    #   _In_       UINT nIcons,
    #   _In_       UINT flags )
    encoded_function 'PrivateExtractIcons', [:string, :int, :int, :int, :hicon, :pointer, :uint, LoadResourceFlags], :uint

    if WindowsVersion >= :vista

      require 'win-ffi/user32/struct/resource/icon/icon_info_ex'

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648071(v=vs.85).aspx
      # BOOL WINAPI GetIconInfoEx(
      #   _In_     HICON hIcon,
      #   _Inout_  PICONINFOEX piconinfoex )
      encoded_function 'GetIconInfoEx', [:hicon, ICONINFOEX.ptr], :bool
    end
  end
end
