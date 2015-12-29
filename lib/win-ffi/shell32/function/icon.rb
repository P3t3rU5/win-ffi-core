require 'win-ffi/shell32'

require 'win-ffi/general/enum/load_resource_flags'

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
    encoded_function 'ExtractAssociatedIcon', [:hinstance, :string, :pointer], :hicon

    #HICON WINAPI ExtractIcon(
    #  _Reserved_  HINSTANCE hInst,
    #  _In_        LPCTSTR lpszExeFileName,
    #  _In_        UINT nIconIndex )
    encoded_function 'ExtractIcon', [:hinstance, :string, :uint], :hicon

    #UINT WINAPI ExtractIconEx(
    #  _In_       LPCTSTR lpszFile,
    #  _In_       int nIconIndex,
    #  _Out_opt_  HICON *phiconLarge,
    #  _Out_opt_  HICON *phiconSmall,
    #  _In_       UINT nIcons )
    encoded_function 'ExtractIconEx', [:string, :int, :pointer, :pointer, :uint], :uint

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
      encoded_function 'PrivateExtractIcons', [:string, :int, :int, :int, :hicon, :pointer, :uint, LoadResourceFlags], :uint
  end
end