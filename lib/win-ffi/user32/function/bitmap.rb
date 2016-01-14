require 'win-ffi/user32'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145033(v=vs.85).aspx
    # HBITMAP LoadBitmap(
    #   _In_  HINSTANCE hInstance,
    #   _In_  LPCTSTR lpBitmapName )
    encoded_function 'LoadBitmap', [:hinstance, :string], :hbitmap
  end
end