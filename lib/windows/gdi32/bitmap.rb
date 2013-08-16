module WinFFI
  module Gdi32
    module Bitmap
      extend LibBase

      ffi_lib 'gdi32'

      DIB_RGB_COLORS = 0
      DIB_PAL_COLORS = 1

      # Raster operations
      SRCCOPY      = 0x00CC0020
      SRCPAINT     = 0x00EE0086
      SRCAND       = 0x008800C6
      SRCINVERT    = 0x00660046
      SRCERASE     = 0x00440328
      NOTSRCCOPY   = 0x00330008
      NOTSRCERASE  = 0x001100A6
      MERGECOPY    = 0x00C000CA
      MERGEPAINT   = 0x00BB0226
      PATCOPY      = 0x00F00021
      PATPAINT     = 0x00FB0A09
      PATINVERT    = 0x005A0049
      STINVERT     = 0x00550009
      BLACKNESS    = 0x00000042
      WHITENESS    = 0x00FF0062

      class BITMAP < FFI::Struct
        layout :bmType,       :long,
               :bmWidth,      :long,
               :bmHeight,     :long,
               :bmWidthBytes, :long,
               :bmPlanes,     :word,
               :bmBitsPixel,  :word,
               :bmBits,       :pointer
      end

      class BITMAPINFOHEADER < FFI::Struct
        layout :biSize,          :dword,
               :biWidth,         :long,
               :biHeight,        :long,
               :biPlanes,        :word,
               :biBitCount,      :word,
               :biCompression,   :dword,
               :biSizeImage,     :dword,
               :biXPelsPerMeter, :long,
               :biYPelsPerMeter, :long,
               :biClrUsed,       :dword,
               :biClrImportant,  :dword
      end

      class BLENDFUNCTION < FFI::Struct
        layout :BlendOp,             :byte,
               :BlendFlags,          :byte,
               :SourceConstantAlpha, :byte,
               :AlphaFormat,         :byte
      end

      class RGBQUAD < FFI::Struct
        layout :rgbBlue,     :byte,
               :rgbGreen,    :byte,
               :rgbRed,      :byte,
               :rgbReserved, :byte
      end

      class BITMAPINFO < FFI::Struct
        layout :bmiHeader, BITMAPINFOHEADER,
               :bmiColors, RGBQUAD
      end

      #BOOL BitBlt(
      #  _In_  HDC hdcDest,
      #  _In_  int nXDest,
      #  _In_  int nYDest,
      #  _In_  int nWidth,
      #  _In_  int nHeight,
      #  _In_  HDC hdcSrc,
      #  _In_  int nXSrc,
      #  _In_  int nYSrc,
      #  _In_  DWORD dwRop )
      attach_function 'BitBlt', [:hdc, :int, :int, :int, :int, :hdc, :int, :int, :dword], :bool

      #HBITMAP CreateBitmap(
      #  _In_  int nWidth,
      #  _In_  int nHeight,
      #  _In_  UINT cPlanes,
      #  _In_  UINT cBitsPerPel,
      #  _In_  const VOID *lpvBits )
      attach_function 'CreateBitmap', [:int, :int, :uint, :uint, :pointer], :hbitmap

      #HBITMAP CreateBitmapIndirect( _In_  const BITMAP *lpbm )
      attach_function 'CreateBitmapIndirect', [BITMAP.ptr], :hbitmap

      #HBITMAP CreateCompatibleBitmap(
      #  _In_  HDC hdc,
      #  _In_  int nWidth,
      #  _In_  int nHeight )
      attach_function 'CreateCompatibleBitmap', [:hdc, :int, :int], :hbitmap

      #HBITMAP CreateDIBitmap(
      #  _In_  HDC hdc,
      #  _In_  const BITMAPINFOHEADER *lpbmih,
      #  _In_  DWORD fdwInit,
      #  _In_  const VOID *lpbInit,
      #  _In_  const BITMAPINFO *lpbmi,
      #  _In_  UINT fuUsage )
      attach_function 'CreateDIBitmap', [:hdc, :pointer, :dword, :pointer, :pointer], :hbitmap

      #HBITMAP CreateDIBSection(
      #  _In_   HDC hdc,
      #  _In_   const BITMAPINFO *pbmi,
      #  _In_   UINT iUsage,
      #  _Out_  VOID **ppvBits,
      #  _In_   HANDLE hSection,
      #  _In_   DWORD dwOffset )
      attach_function 'CreateDIBSection', [:hdc, :pointer, :uint, :pointer, :handle, :dword], :hbitmap

      #[This function is provided only for compatibility with 16-bit versions of Windows. Applications should use the CreateCompatibleBitmap function.]
      #HBITMAP CreateDiscardableBitmap(
      #  _In_  HDC hdc,
      #  _In_  int nWidth,
      #  _In_  int nHeight )
      attach_function 'CreateDiscardableBitmap', [:hdc, :int, :int], :hbitmap

      #BOOL ExtFloodFill(
      #  _In_  HDC hdc,
      #  _In_  int nXStart,
      #  _In_  int nYStart,
      #  _In_  COLORREF crColor,
      #  _In_  UINT fuFillType )
      attach_function 'ExtFloodFill', [:hdc, :int, :int, :colorref, :uint], :bool

      #BOOL FloodFill(
      #  _In_  HDC hdc,
      #  _In_  int nXStart,
      #  _In_  int nYStart,
      #  _In_  COLORREF crFill )
      attach_function 'FloodFill', [:hdc, :int, :int, :colorref], :bool

      #BOOL GdiAlphaBlend(
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
      attach_function 'GdiAlphaBlend', [:hdc, :int, :int, :int, :int, :hdc, :int, :int, :int, :int, BLENDFUNCTION], :bool

      #BOOL GdiGradientFill(
      #  _In_  HDC hdc,
      #  _In_  PTRIVERTEX pVertex,
      #  _In_  ULONG dwNumVertex,
      #  _In_  PVOID pMesh,
      #  _In_  ULONG dwNumMesh,
      #  _In_  ULONG dwMode )
      attach_function 'GdiGradientFill', [:hdc, :pointer, :ulong, :pointer, :ulong, :ulong], :bool

      #BOOL GdiTransparentBlt(
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
      attach_function 'GdiTransparentBlt', [:hdc, :int, :int, :int, :int, :hdc, :int, :int, :int, :int, :uint], :bool

      #LONG GetBitmapBits(
      #  _In_   HBITMAP hbmp,
      #  _In_   LONG cbBuffer,
      #  _Out_  LPVOID lpvBits )
      attach_function 'GetBitmapBits', [:hbitmap, :long, :pointer], :long

      #BOOL GetBitmapDimensionEx(
      #  _In_   HBITMAP hBitmap,
      #  _Out_  LPSIZE lpDimension )
      attach_function 'GetBitmapDimensionEx', [:hbitmap, SIZE.ptr], :bool

      #UINT GetDIBColorTable(
      #  _In_   HDC hdc,
      #  _In_   UINT uStartIndex,
      #  _In_   UINT cEntries,
      #  _Out_  RGBQUAD *pColors )
      attach_function 'GetDIBColorTable', [:hdc, :uint, :uint, :pointer], :uint

      #int GetDIBits(
      #  _In_     HDC hdc,
      #  _In_     HBITMAP hbmp,
      #  _In_     UINT uStartScan,
      #  _In_     UINT cScanLines,
      #  _Out_    LPVOID lpvBits,
      #  _Inout_  LPBITMAPINFO lpbi,
      #  _In_     UINT uUsage )
      attach_function 'GetDIBits', [:hdc, :hbitmap, :uint, :uint, :pointer, :pointer, :uint], :int

      #COLORREF GetPixel(
      #  _In_  HDC hdc,
      #  _In_  int nXPos,
      #  _In_  int nYPos )
      attach_function 'GetPixel', [:hdc, :int, :int], :colorref

      #int GetStretchBltMode( _In_  HDC hdc )
      attach_function 'GetStretchBltMode', [:hdc], :int

      #BOOL MaskBlt(
      #  _In_  HDC hdcDest,
      #  _In_  int nXDest,
      #  _In_  int nYDest,
      #  _In_  int nWidth,
      #  _In_  int nHeight,
      #  _In_  HDC hdcSrc,
      #  _In_  int nXSrc,
      #  _In_  int nYSrc,
      #  _In_  HBITMAP hbmMask,
      #  _In_  int xMask,
      #  _In_  int yMask,
      #  _In_  DWORD dwRop )
      attach_function 'MaskBlt', [:hdc, :int, :int, :int, :int, :hdc, :int, :int, :hbitmap, :int, :int, :dword], :bool

      #BOOL PlgBlt(
      #  _In_  HDC hdcDest,
      #  _In_  const POINT *lpPoint,
      #  _In_  HDC hdcSrc,
      #  _In_  int nXSrc,
      #  _In_  int nYSrc,
      #  _In_  int nWidth,
      #  _In_  int nHeight,
      #  _In_  HBITMAP hbmMask,
      #  _In_  int xMask,
      #  _In_  int yMask )
      attach_function 'PlgBlt', [:hdc, POINT.ptr, :hdc, :int, :int, :int, :int, :hbitmap, :int, :int], :bool

      #LONG SetBitmapBits(
      #  _In_  HBITMAP hbmp,
      #  _In_  DWORD cBytes,
      #  _In_  const VOID *lpBits )
      attach_function 'SetBitmapBits', [:hbitmap, :dword, :pointer], :long

      #BOOL SetBitmapDimensionEx(
      #  _In_   HBITMAP hBitmap,
      #  _In_   int nWidth,
      #  _In_   int nHeight,
      #  _Out_  LPSIZE lpSize )
      attach_function 'SetBitmapDimensionEx', [:hbitmap, :int, :int, SIZE.ptr], :bool

      #UINT SetDIBColorTable(
      #  _In_  HDC hdc,
      #  _In_  UINT uStartIndex,
      #  _In_  UINT cEntries,
      #  _In_  const RGBQUAD *pColors )
      attach_function 'SetDIBColorTable', [:hdc, :uint, :uint, RGBQUAD.ptr], :uint

      #int SetDIBits(
      #  _In_  HDC hdc,
      #  _In_  HBITMAP hbmp,
      #  _In_  UINT uStartScan,
      #  _In_  UINT cScanLines,
      #  _In_  const VOID *lpvBits,
      #  _In_  const BITMAPINFO *lpbmi,
      #  _In_  UINT fuColorUse )
      attach_function 'SetDIBits', [:hdc, :hbitmap, :uint, :uint, :pointer, BITMAPINFO.ptr, :uint], :int

      #int SetDIBitsToDevice(
      #  _In_  HDC hdc,
      #  _In_  int XDest,
      #  _In_  int YDest,
      #  _In_  DWORD dwWidth,
      #  _In_  DWORD dwHeight,
      #  _In_  int XSrc,
      #  _In_  int YSrc,
      #  _In_  UINT uStartScan,
      #  _In_  UINT cScanLines,
      #  _In_  const VOID *lpvBits,
      #  _In_  const BITMAPINFO *lpbmi,
      #  _In_  UINT fuColorUse )
      attach_function 'SetDIBitsToDevice', [:hdc, :int, :int, :dword, :dword, :int, :int, :uint, :uint, :pointer, BITMAPINFO.ptr, :uint], :int

      #COLORREF SetPixel(
      #  _In_  HDC hdc,
      #  _In_  int X,
      #  _In_  int Y,
      #  _In_  COLORREF crColor )
      attach_function 'SetPixel', [:hdc, :int, :int, :colorref], :colorref

      #BOOL SetPixelV(
      #  _In_  HDC hdc,
      #  _In_  int X,
      #  _In_  int Y,
      #  _In_  COLORREF crColor )
      attach_function 'SetPixelV', [:hdc, :int, :int, :colorref], :bool

      #int SetStretchBltMode(
      #  _In_  HDC hdc,
      #  _In_  int iStretchMode )
      attach_function 'SetStretchBltMode', [:hdc, :int], :int

      #BOOL StretchBlt(
      #  _In_  HDC hdcDest,
      #  _In_  int nXOriginDest,
      #  _In_  int nYOriginDest,
      #  _In_  int nWidthDest,
      #  _In_  int nHeightDest,
      #  _In_  HDC hdcSrc,
      #  _In_  int nXOriginSrc,
      #  _In_  int nYOriginSrc,
      #  _In_  int nWidthSrc,
      #  _In_  int nHeightSrc,
      #  _In_  DWORD dwRop )
      attach_function 'StretchBlt', [:hdc, :int, :int, :int, :int, :hdc, :int, :int, :int, :int, :dword], :bool

      #int StretchDIBits(
      #  _In_  HDC hdc,
      #  _In_  int XDest,
      #  _In_  int YDest,
      #  _In_  int nDestWidth,
      #  _In_  int nDestHeight,
      #  _In_  int XSrc,
      #  _In_  int YSrc,
      #  _In_  int nSrcWidth,
      #  _In_  int nSrcHeight,
      #  _In_  const VOID *lpBits,
      #  _In_  const BITMAPINFO *lpBitsInfo,
      #  _In_  UINT iUsage,
      #  _In_  DWORD dwRop )
      attach_function 'StretchDIBits', [:hdc, :int, :int, :int, :int, :int, :int, :int, :int, :pointer, BITMAPINFO.ptr, :uint, :dword], :int

      ffi_lib 'msimg32'

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
      attach_function 'AlphaBlend', [:hdc, :int, :int, :int, :int, :hdc, :int, :int, :int, :int, BLENDFUNCTION], :bool

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

      ffi_lib 'user32'

      #HBITMAP LoadBitmap(
      #  _In_  HINSTANCE hInstance,
      #  _In_  LPCTSTR lpBitmapName )
      attach_function 'LoadBitmapA', [:hinstance, :string], :hbitmap
      attach_function 'LoadBitmapW', [:hinstance, :string], :hbitmap
    end
  end
end