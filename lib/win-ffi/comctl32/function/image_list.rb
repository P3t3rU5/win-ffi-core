require 'win-ffi/comctl32'

require 'win-ffi/comctl32/enum/image_list_draw'
require 'win-ffi/comctl32/enum/image_list_creation_flags'

require 'win-ffi/general/struct/point'
require 'win-ffi/comctl32/struct/image_info'
require 'win-ffi/comctl32/struct/image_list_draw_params'

module WinFFI
  module Comctl32

    typedef :pointer, :himagelist

    if WindowsVersion >= :vista
      # HIMAGELIST ImageList_Create(int cx, int cy, UINT flags, int cInitial, int cGrow);
      attach_function 'ImageList_Create', [:int, :int, ImageListCreationFlags, :int, :int], :himagelist

      # BOOL    ImageList_Destroy(_In_opt_ HIMAGELIST himl);
      attach_function 'ImageList_Destroy', [:himagelist], :bool

      # int    ImageList_GetImageCount(_In_ HIMAGELIST himl);
      attach_function 'ImageList_GetImageCount', [:himagelist], :int

      # BOOL    ImageList_SetImageCount(_In_ HIMAGELIST himl, _In_ UINT uNewCount);
      attach_function 'ImageList_SetImageCount', [:himagelist, :uint], :bool

      # int    ImageList_Add(_In_ HIMAGELIST himl, _In_ HBITMAP hbmImage, _In_opt_ HBITMAP hbmMask);
      attach_function 'ImageList_Add', [:himagelist, :hbitmap, :hbitmap], :int

      # int    ImageList_ReplaceIcon(_In_ HIMAGELIST himl, _In_ int i, _In_ HICON hicon);
      attach_function 'ImageList_ReplaceIcon', [:himagelist, :int, :hicon], :int

      # COLORREF  ImageList_SetBkColor(_In_ HIMAGELIST himl, _In_ COLORREF clrBk);
      attach_function 'ImageList_SetBkColor', [:himagelist, :colorref], :colorref

      # COLORREF  ImageList_GetBkColor(_In_ HIMAGELIST himl);
      attach_function 'ImageList_GetBkColor', [:himagelist], :colorref

      # BOOL    ImageList_SetOverlayImage(_In_ HIMAGELIST himl, _In_ int iImage, _In_ int iOverlay);
      attach_function 'ImageList_SetOverlayImage', [:himagelist, :int, :int], :bool

      # BOOL    ImageList_Replace(_In_ HIMAGELIST himl, _In_ int i, _In_ HBITMAP hbmImage, _In_opt_ HBITMAP hbmMask);
      attach_function 'ImageList_Replace', [:himagelist, :int, :hbitmap, :hbitmap], :bool

      # int    ImageList_AddMasked(_In_ HIMAGELIST himl, _In_ HBITMAP hbmImage, _In_ COLORREF crMask);
      attach_function 'ImageList_AddMasked', [:himagelist, :hbitmap, :colorref], :int

      # ImageList_Draw(_In_ HIMAGELIST himl, _In_ int i, _In_ HDC hdcDst, _In_ int x, _In_ int y, _In_ UINT fStyle)
      attach_function 'ImageList_Draw', [:himagelist, :int, :hdc, :int, :int, ImageListDraw], :bool

      # BOOL    ImageList_DrawEx(_In_ HIMAGELIST himl, _In_ int i, _In_ HDC hdcDst, _In_ int x, _In_ int y, _In_ int dx, _In_ int dy, _In_ COLORREF rgbBk, _In_ COLORREF rgbFg, _In_ UINT fStyle);
      attach_function 'ImageList_DrawEx', [:himagelist, :int, :hdc, :int, :int, :int, :int, :colorref, :colorref, :uint], :bool

      # BOOL    ImageList_DrawIndirect(_In_ IMAGELISTDRAWPARAMS* pimldp);
      attach_function 'ImageList_DrawIndirect', [IMAGELISTDRAWPARAMS], :bool

      # BOOL    ImageList_Remove(_In_ HIMAGELIST himl, _In_ int i);
      attach_function 'ImageList_Remove', [:himagelist, :int], :bool

      # HICON   ImageList_GetIcon(_In_ HIMAGELIST himl, _In_ int i, _In_ UINT flags);
      attach_function 'ImageList_GetIcon', [:himagelist, :int, ImageListDraw], :hicon

      # HIMAGELIST ImageList_LoadImageA(HINSTANCE hi, LPCSTR lpbmp, int cx, int cGrow, COLORREF crMask, UINT uType, UINT uFlags);
      encoded_function 'ImageList_LoadImage', [:hinstance, :string, :int, :int, :colorref, :uint, LoadResourceFlags], :himagelist

      # BOOL    ImageList_Copy(_In_ HIMAGELIST himlDst, _In_ int iDst, _In_ HIMAGELIST himlSrc, _In_ int iSrc, _In_ UINT uFlags);
      attach_function 'ImageList_Copy', [:himagelist, :int, :himagelist, :int, :uint], :bool

      # BOOL    ImageList_BeginDrag(_In_ HIMAGELIST himlTrack, _In_ int iTrack, _In_ int dxHotspot, _In_ int dyHotspot);
      attach_function 'ImageList_BeginDrag', [:himagelist, :int, :int, :int], :bool

      # void    ImageList_EndDrag(void);
      attach_function 'ImageList_EndDrag', [], :void

      # BOOL    ImageList_DragEnter(HWND hwndLock, int x, int y);
      attach_function 'ImageList_DragEnter', [:hwnd, :int, :int], :bool

      # BOOL    ImageList_DragLeave(HWND hwndLock);
      attach_function 'ImageList_DragLeave', [:hwnd], :bool

      # BOOL    ImageList_DragMove(int x, int y);
      attach_function 'ImageList_DragMove', [:int, :int], :bool

      # BOOL    ImageList_SetDragCursorImage(_In_ HIMAGELIST himlDrag, _In_ int iDrag, _In_ int dxHotspot, _In_ int dyHotspot);
      attach_function 'ImageList_SetDragCursorImage', [:himagelist, :int, :int, :int], :bool

      # BOOL    ImageList_DragShowNolock(BOOL fShow);
      attach_function 'ImageList_DragShowNolock', [:bool], :bool

      # HIMAGELIST ImageList_GetDragImage(_Out_opt_ POINT *ppt, _Out_opt_ POINT *pptHotspot);
      attach_function 'ImageList_GetDragImage', [POINT, POINT], :himagelist

      # HIMAGELIST ImageList_Read(_In_ struct IStream *pstm);
      attach_function 'ImageList_Read', [:pointer], :himagelist

      # BOOL    ImageList_Write(_In_ HIMAGELIST himl, _In_ struct IStream *pstm);
      attach_function 'ImageList_Write', [:himagelist, :pointer], :bool

      # BOOL    ImageList_GetIconSize(_In_ HIMAGELIST himl, _Out_opt_ int *cx, _Out_opt_ int *cy);
      attach_function 'ImageList_GetIconSize', [:himagelist, :int, :int], :bool

      # BOOL    ImageList_SetIconSize(_In_ HIMAGELIST himl, _In_ int cx, _In_ int cy);
      attach_function 'ImageList_SetIconSize', [:himagelist, :int, :int], :bool

      # BOOL    ImageList_GetImageInfo(_In_ HIMAGELIST himl, _In_ int i, _Out_ IMAGEINFO *pImageInfo);
      attach_function 'ImageList_GetImageInfo', [:himagelist, :int, IMAGEINFO], :bool

      # HIMAGELIST ImageList_Merge(_In_ HIMAGELIST himl1, _In_ int i1, _In_ HIMAGELIST himl2, _In_ int i2, _In_ int dx, _In_ int dy);
      attach_function 'ImageList_Merge', [:himagelist, :int, :himagelist, :int, :int, :int], :himagelist

      # HIMAGELIST ImageList_Duplicate(_In_ HIMAGELIST himl);
      attach_function 'ImageList_Duplicate', [:himagelist], :himagelist
    end
  end
end