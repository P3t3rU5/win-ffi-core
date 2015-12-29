require 'win-ffi/gdi32'

require 'win-ffi/gdi32/struct/pixel_format_descriptor'

module WinFFI
  module Gdi32

    #int ChoosePixelFormat(
    #  HDC hdc,
    #  const PIXELFORMATDESCRIPTOR *ppfd)
    attach_function 'ChoosePixelFormat', [:pointer, PIXELFORMATDESCRIPTOR.ptr], :int

    #int DescribePixelFormat(
    #  HDC hdc,
    #  int iPixelFormat,
    #  UINT nBytes,
    #  LPPIXELFORMATDESCRIPTOR ppfd)
    attach_function 'DescribePixelFormat', [:pointer, :int, :uint, :pointer], :int

    #BOOL SetPixelFormat(
    #  HDC hdc,
    #  int iPixelFormat,
    #  const PIXELFORMATDESCRIPTOR *ppfd)
    attach_function 'SetPixelFormat', [:pointer, :int, :pointer], :bool

    #BOOL SwapBuffers(  HDC hdc)
    attach_function 'SwapBuffers', [:pointer], :bool
  end
end