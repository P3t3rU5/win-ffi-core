require_relative '../../enums/user32/image'
require_relative '../../enums/user32/ocr'
require_relative '../../enums/user32/oic'

module WinFFI
  module User32
    #HANDLE WINAPI CopyImage(
    #  _In_  HANDLE hImage,
    #  _In_  UINT uType,
    #  _In_  int cxDesired,
    #  _In_  int cyDesired,
    #  _In_  UINT fuFlags )
    attach_function 'CopyImage', [:handle, :uint, :int, :int, LR], :handle

    #HANDLE LoadImage(
    #  __in_opt  HINSTANCE hinst,
    #  __in      LPCTSTR   lpszName,
    #  __in      UINT      uType,
    #  __in      int       cxDesired,
    #  __in      int       cyDesired,
    #  __in      UINT      fuLoad)
    attach_function 'LoadImageA', [:hinstance, :pointer, Image, :int, :int, :uint], :handle
    attach_function 'LoadImageW', [:hinstance, :pointer, Image, :int, :int, :uint], :handle
  end
end