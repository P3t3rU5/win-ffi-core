require 'win-ffi/user32'

module WinFFI
  module User32
    #HBITMAP LoadBitmap(
    #  _In_  HINSTANCE hInstance,
    #  _In_  LPCTSTR lpBitmapName )
    encoded_function 'LoadBitmap', [:hinstance, :string], :hbitmap
  end
end