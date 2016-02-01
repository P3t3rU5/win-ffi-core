require 'win-ffi/user32'

require 'win-ffi/general/enum/load_resource_flags'
require 'win-ffi/user32/enum/resource/bitmap/oem_bitmap'
require 'win-ffi/user32/enum/resource/cursor/oem_cursor'
require 'win-ffi/user32/enum/resource/icon/oem_icon'
require 'win-ffi/user32/enum/resource/image'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648031(v=vs.85).aspx
    # HANDLE WINAPI CopyImage(
    #   _In_  HANDLE hImage,
    #   _In_  UINT uType,
    #   _In_  int cxDesired,
    #   _In_  int cyDesired,
    #   _In_  UINT fuFlags )
    attach_function 'CopyImage', [:handle, Image, :int, :int, LoadResourceFlags], :handle

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648045(v=vs.85).aspx
    # HANDLE LoadImage(
    #   __in_opt  HINSTANCE hinst,
    #   __in      LPCTSTR   lpszName,
    #   __in      UINT      uType,
    #   __in      int       cxDesired,
    #   __in      int       cyDesired,
    #   __in      UINT      fuLoad)
    encoded_function 'LoadImage', [:hinstance, :pointer, Image, :int, :int, :uint], :handle
  end
end