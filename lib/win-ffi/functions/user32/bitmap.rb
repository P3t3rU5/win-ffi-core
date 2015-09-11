require 'win-ffi/functions/user32'

module WinFFI
  module User32
    #HBITMAP LoadBitmap(
    #  _In_  HINSTANCE hInstance,
    #  _In_  LPCTSTR lpBitmapName )
    attach_function 'LoadBitmapA', [:hinstance, :string], :hbitmap
    attach_function 'LoadBitmapW', [:hinstance, :string], :hbitmap
  end
end