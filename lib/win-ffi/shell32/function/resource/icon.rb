require 'win-ffi/shell32'

require 'win-ffi/general/enum/load_resource_flags'

module WinFFI
  module Shell32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648066(v=vs.85).aspx
    # HICON WINAPI DuplicateIcon(
    #   _Reserved_  HINSTANCE hInst,
    #   _In_        HICON hIcon )
    attach_function 'DuplicateIcon', [:hinstance, :hicon], :hicon

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648067(v=vs.85).aspx
    # HICON WINAPI ExtractAssociatedIcon(
    #   _Reserved_  HINSTANCE hInst,
    #   _Inout_     LPTSTR lpIconPath,
    #   _Inout_     WORD *lpiIcon )
    encoded_function 'ExtractAssociatedIcon', [:hinstance, :string, :pointer], :hicon

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648068(v=vs.85).aspx
    # HICON WINAPI ExtractIcon(
    #   _Reserved_  HINSTANCE hInst,
    #   _In_        LPCTSTR lpszExeFileName,
    #   _In_        UINT nIconIndex )
    encoded_function 'ExtractIcon', [:hinstance, :string, :uint], :hicon

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648069(v=vs.85).aspx
    # UINT WINAPI ExtractIconEx(
    #   _In_       LPCTSTR lpszFile,
    #   _In_       int nIconIndex,
    #   _Out_opt_  HICON *phiconLarge,
    #   _Out_opt_  HICON *phiconSmall,
    #   _In_       UINT nIcons )
    encoded_function 'ExtractIconEx', [:string, :int, :pointer, :pointer, :uint], :uint
  end
end