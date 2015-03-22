module WinFFI
  module User32
    #BOOL CopyRect(
    #  _Out_  LPRECT lprcDst,
    #  _In_   const RECT *lprcSrc )
    attach_function 'CopyRect', [RECT.ptr, RECT.ptr], :bool

    #BOOL EqualRect(
    #  _In_  const RECT *lprc1,
    #  _In_  const RECT *lprc2 )
    attach_function 'EqualRect', [RECT.ptr, RECT.ptr], :bool

    #BOOL InflateRect(
    #  _Inout_  LPRECT lprc,
    #  _In_     int dx,
    #  _In_     int dy )
    attach_function 'InflateRect', [RECT.ptr, :int, :int], :bool

    #BOOL IntersectRect(
    #  _Out_  LPRECT lprcDst,
    #  _In_   const RECT *lprcSrc1,
    #  _In_   const RECT *lprcSrc2 )
    attach_function 'IntersectRect', [RECT.ptr, RECT.ptr, RECT.ptr], :bool

    #BOOL IsRectEmpty( _In_  const RECT *lprc )
    attach_function 'IsRectEmpty', [RECT.ptr], :bool

    #BOOL OffsetRect(
    #  _Inout_  LPRECT lprc,
    #  _In_     int dx,
    #  _In_     int dy )
    attach_function 'OffsetRect', [RECT.ptr, :int, :int], :bool

    #BOOL PtInRect(
    #  _In_  const RECT *lprc,
    #  _In_  POINT pt )
    attach_function 'PtInRect', [RECT.ptr, POINT], :bool

    #BOOL SetRect(
    #  _Out_  LPRECT lprc,
    #  _In_   int xLeft,
    #  _In_   int yTop,
    #  _In_   int xRight,
    #  _In_   int yBottom )
    attach_function 'SetRect', [RECT.ptr, :int, :int, :int, :int], :bool

    #BOOL SetRectEmpty( _Out_  LPRECT lprc )
    attach_function 'SetRectEmpty', [RECT.ptr], :bool

    #BOOL SubtractRect(
    #  _Out_  LPRECT lprcDst,
    #  _In_   const RECT *lprcSrc1,
    #  _In_   const RECT *lprcSrc2 )
    attach_function 'SubtractRect', [RECT.ptr, RECT.ptr, RECT.ptr], :bool

    #BOOL UnionRect(
    #  _Out_  LPRECT lprcDst,
    #  _In_   const RECT *lprcSrc1,
    #  _In_   const RECT *lprcSrc2 )
    attach_function 'UnionRect', [RECT.ptr, RECT.ptr, RECT.ptr], :bool

  end
end