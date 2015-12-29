require 'win-ffi/msimg32'

require 'win-ffi/gdi32/struct/blend_function'

module WinFFI
  module Msimg32

    #BOOL AlphaBlend(
    #  _In_  HDC hdcDest,
    #  _In_  int xoriginDest,
    #  _In_  int yoriginDest,
    #  _In_  int wDest,
    #  _In_  int hDest,
    #  _In_  HDC hdcSrc,
    #  _In_  int xoriginSrc,
    #  _In_  int yoriginSrc,
    #  _In_  int wSrc,
    #  _In_  int hSrc,
    #  _In_  BLENDFUNCTION ftn )
    attach_function 'AlphaBlend', [:hdc, :int, :int, :int, :int, :hdc, :int, :int, :int, :int, Gdi32::BLENDFUNCTION], :bool

    #BOOL GradientFill(
    #  _In_  HDC hdc,
    #  _In_  PTRIVERTEX pVertex,
    #  _In_  ULONG nVertex,
    #  _In_  PVOID pMesh,
    #  _In_  ULONG nMesh,
    #  _In_  ULONG ulMode )
    attach_function 'GradientFill', [:hdc, :pointer, :ulong, :pointer, :ulong, :ulong], :bool

    #BOOL TransparentBlt(
    #  _In_  HDC hdcDest,
    #  _In_  int xoriginDest,
    #  _In_  int yoriginDest,
    #  _In_  int wDest,
    #  _In_  int hDest,
    #  _In_  HDC hdcSrc,
    #  _In_  int xoriginSrc,
    #  _In_  int yoriginSrc,
    #  _In_  int wSrc,
    #  _In_  int hSrc,
    #  _In_  UINT crTransparent )
    attach_function 'TransparentBlt', [:hdc, :int, :int, :int, :int, :hdc, :int, :int, :int, :int, :uint], :bool
  end
end