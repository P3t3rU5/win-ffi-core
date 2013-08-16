module WinFFI
  module User32
    module Icon
      extend LibBase

      ffi_lib 'user32'

      class ICONINFO < FFI::Struct
        layout :fIcon,    :bool,
               :xHotspot, :dword,
               :yHotspot, :dword,
               :hbmMask,  :pointer,
               :hbmColor, :pointer
      end

      class ICONINFOEX < FFI::Struct
        layout :cbSize,    :dword,
               :fIcon,     :bool,
               :xHotspot,  :dword,
               :yHotspot,  :dword,
               :hbmMask,   :pointer,
               :hbmColor,  :pointer,
               :wResID,    :word,
               :szModName, :string,
               :szResName, :string
      end

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

      #BOOL WINAPI GetIconInfoEx(
      #  _In_     HICON hIcon,
      #  _Inout_  PICONINFOEX piconinfoex )
      attach_function 'GetIconInfoExA', [:hicon, ICONINFOEX.ptr], :bool
      attach_function 'GetIconInfoExW', [:hicon, ICONINFOEX.ptr], :bool

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

      ffi_lib 'shell32'

      #HICON WINAPI DuplicateIcon(
      #  _Reserved_  HINSTANCE hInst,
      #  _In_        HICON hIcon )
      attach_function 'DuplicateIcon', [:hinstance, :hicon], :hicon

      #HICON WINAPI ExtractAssociatedIcon(
      #  _Reserved_  HINSTANCE hInst,
      #  _Inout_     LPTSTR lpIconPath,
      #  _Inout_     WORD *lpiIcon )
      attach_function 'ExtractAssociatedIconA', [:hinstance, :string, :pointer], :hicon
      attach_function 'ExtractAssociatedIconW', [:hinstance, :string, :pointer], :hicon

      #HICON WINAPI ExtractIcon(
      #  _Reserved_  HINSTANCE hInst,
      #  _In_        LPCTSTR lpszExeFileName,
      #  _In_        UINT nIconIndex )
      attach_function 'ExtractIconA', [:hinstance, :string, :uint], :hicon
      attach_function 'ExtractIconW', [:hinstance, :string, :uint], :hicon

      #UINT WINAPI ExtractIconEx(
      #  _In_       LPCTSTR lpszFile,
      #  _In_       int nIconIndex,
      #  _Out_opt_  HICON *phiconLarge,
      #  _Out_opt_  HICON *phiconSmall,
      #  _In_       UINT nIcons )
      attach_function 'ExtractIconExA', [:string, :int, :pointer, :pointer, :uint], :uint
      attach_function 'ExtractIconExW', [:string, :int, :pointer, :pointer, :uint], :uint

      begin
        #[This function is not intended for general use. It may be altered or unavailable in subsequent versions of Windows.]
        #UINT WINAPI PrivateExtractIcons(
        #  _In_       LPCTSTR lpszFile,
        #  _In_       int nIconIndex,
        #  _In_       int cxIcon,
        #  _In_       int cyIcon,
        #  _Out_opt_  HICON *phicon,
        #  _Out_opt_  UINT *piconid,
        #  _In_       UINT nIcons,
        #  _In_       UINT flags )
        attach_function 'PrivateExtractIconsA', [:string, :int, :int, :int, :hicon, :pointer, :uint, LR], :uint
        attach_function 'PrivateExtractIconsW', [:string, :int, :int, :int, :hicon, :pointer, :uint, LR], :uint
      rescue FFI::NotFoundError
      end

    end
  end
end