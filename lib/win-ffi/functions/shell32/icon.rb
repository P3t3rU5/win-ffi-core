module WinFFI
  module Shell32
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
      require 'win-ffi/enums/lr'

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