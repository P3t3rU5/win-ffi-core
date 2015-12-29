require 'win-ffi/user32'

module WinFFI
  module User32

    # int FillRect(
    #   _In_  HDC hDC,
    #   _In_  const RECT *lprc,
    #   _In_  HBRUSH hbr )
    attach_function 'FillRect', [:hdc, RECT.ptr, :hbrush], :int

    # int FrameRect(
    #   _In_  HDC hDC,
    #   _In_  const RECT *lprc,
    #   _In_  HBRUSH hbr )
    attach_function 'FrameRect', [:hdc, RECT.ptr, :hbrush], :int

    # BOOL InvertRect(
    #   _In_  HDC hDC,
    #   _In_  const RECT *lprc )
    attach_function 'InvertRect', [:hdc, RECT.ptr], :bool
  end
end