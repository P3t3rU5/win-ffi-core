module WinFFI
  HANDLE    = WinFFI.find_type(:handle)
  LONG_PTR  = WinFFI.find_type(:long_ptr)
  ULONG_PTR = WinFFI.find_type(:ulong_ptr)
  DWORD     = WinFFI.find_type(:dword)
  class << self
    def MAKEWORD(a, b) a & 0xff | ((b & 0xff) << 8) end

    def MAKELONG(a, b) a & 0xffff | ((b & 0xffff) << 16) end

    # ulong
    def MAKELCID(lgid, srtid) srtid << 16 | lgid end

    #define LOWORD(_dw)     ((WORD)(((DWORD_PTR) (_dw)) & 0xffff))
    def LOWORD(l) l & 0xffff end

    #define HIWORD(_dw)     ((WORD)((((DWORD_PTR)(_dw)) >> 16) & 0xffff))
    def HIWORD(l) l >> 16 end

    #define LODWORD(_qw)    ((DWORD)(_qw))

    #define HIDWORD(_qw)    ((DWORD)(((_qw) >> 32) & 0xffffffff))

    #define LOBYTE(w)           ((BYTE)(((DWORD_PTR)(w)) & 0xff))
    def LOBYTE(w) w & 0xff end

    #define HIBYTE(w)           ((BYTE)((((DWORD_PTR)(w)) >> 8) & 0xff))
    def HIBYTE(w) w >> 8 end

    #define HandleToULong( h ) ((ULONG)(ULONG_PTR)(h) )
    def HandleToULong(h) h.address end

    #define HandleToLong( h )  ((LONG)(LONG_PTR) (h) )
    def HandleToLong(h) h.address end

    #define ULongToHandle( ul ) ((HANDLE)(ULONG_PTR) (ul) )
    def ULongToHandle(ul)
      p = FFI::Pointer.new(HANDLE, 1)
      p.write(ULONG_PTR, h)
      p
    end

    #define LongToHandle( h )   ((HANDLE)(LONG_PTR) (h) )
    def LongToHandle(h)
      p = FFI::Pointer.new(HANDLE, 1)
      p.write(LONG_PTR, h)
      p
    end

    #define PtrToUlong( p ) ((ULONG)(ULONG_PTR) (p) )
    #define PtrToLong( p )  ((LONG)(LONG_PTR) (p) )
    #define PtrToUint( p ) ((UINT)(UINT_PTR) (p) )
    #define PtrToInt( p )  ((INT)(INT_PTR) (p) )
    #define PtrToUshort( p ) ((unsigned short)(ULONG_PTR)(p) )
    #define PtrToShort( p )  ((short)(LONG_PTR)(p) )
    #define IntToPtr( i )    ((VOID *)(INT_PTR)((int)i))
    #define UIntToPtr( ui )  ((VOID *)(UINT_PTR)((unsigned int)ui))
    #define LongToPtr( l )   ((VOID *)(LONG_PTR)((long)l))
    #define ULongToPtr( ul ) ((VOID *)(ULONG_PTR)((unsigned long)ul))

  end
end
