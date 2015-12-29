require 'win-ffi/comdlg32'

module WinFFI
  module Comdlg32
    #HWND WINAPI FindText( _In_  LPFINDREPLACE lpfr )
    attach_function 'FindText', :FindTextA, [:pointer], :pointer

    #HWND WINAPI ReplaceText( _Inout_  LPFINDREPLACE lpfr )
    attach_function 'ReplaceText', :ReplaceTextA, [:pointer], :pointer
  end
end
