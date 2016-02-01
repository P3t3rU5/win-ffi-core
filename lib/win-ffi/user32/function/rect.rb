require 'win-ffi/user32'

require 'win-ffi/general/struct/rect'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd183481(v=vs.85).aspx
    # BOOL CopyRect(
    #   _Out_  LPRECT lprcDst,
    #   _In_   const RECT *lprcSrc )
    attach_function 'CopyRect', [RECT.ptr, RECT.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162699(v=vs.85).aspx
    # BOOL EqualRect(
    #   _In_  const RECT *lprc1,
    #   _In_  const RECT *lprc2 )
    attach_function 'EqualRect', [RECT.ptr, RECT.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd144994(v=vs.85).aspx
    # BOOL InflateRect(
    #   _Inout_  LPRECT lprc,
    #   _In_     int dx,
    #   _In_     int dy )
    attach_function 'InflateRect', [RECT.ptr, :int, :int], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145001(v=vs.85).aspx
    # BOOL IntersectRect(
    #   _Out_  LPRECT lprcDst,
    #   _In_   const RECT *lprcSrc1,
    #   _In_   const RECT *lprcSrc2 )
    attach_function 'IntersectRect', [RECT.ptr, RECT.ptr, RECT.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145017(v=vs.85).aspx
    # BOOL IsRectEmpty( _In_  const RECT *lprc )
    attach_function 'IsRectEmpty', [RECT.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162746(v=vs.85).aspx
    # BOOL OffsetRect(
    #   _Inout_  LPRECT lprc,
    #   _In_     int dx,
    #   _In_     int dy )
    attach_function 'OffsetRect', [RECT.ptr, :int, :int], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd162882(v=vs.85).aspx
    # BOOL PtInRect(
    #   _In_  const RECT *lprc,
    #   _In_  POINT pt )
    attach_function 'PtInRect', [RECT.ptr, POINT], :bool

    # https://msdn.microsoft.com/en-us/library/dd145085/
    # BOOL SetRect(
    #   _Out_  LPRECT lprc,
    #   _In_   int xLeft,
    #   _In_   int yTop,
    #   _In_   int xRight,
    #   _In_   int yBottom )
    attach_function 'SetRect', [RECT.ptr, :int, :int, :int, :int], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145086(v=vs.85).aspx
    # BOOL SetRectEmpty( _Out_  LPRECT lprc )
    attach_function 'SetRectEmpty', [RECT.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145125(v=vs.85).aspx
    # BOOL SubtractRect(
    #   _Out_  LPRECT lprcDst,
    #   _In_   const RECT *lprcSrc1,
    #   _In_   const RECT *lprcSrc2 )
    attach_function 'SubtractRect', [RECT.ptr, RECT.ptr, RECT.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd145163(v=vs.85).aspx
    # BOOL UnionRect(
    #   _Out_  LPRECT lprcDst,
    #   _In_   const RECT *lprcSrc1,
    #   _In_   const RECT *lprcSrc2 )
    attach_function 'UnionRect', [RECT.ptr, RECT.ptr, RECT.ptr], :bool
  end
end