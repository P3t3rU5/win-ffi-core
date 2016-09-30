module WinFFI
  class << self
    def MAKEWORD(a, b)
      ((a & 0xff) | ((b & 0xff) << 8))
    end

    def MAKELONG(a, b)
      ((a & 0xffff) | ((b & 0xffff) << 16))
    end

    def MAKELCID(lgid, srtid) # ulong
      srtid << 16 | lgid
    end

    #define LOWORD(_dw)     ((WORD)(((DWORD_PTR)(_dw)) & 0xffff))
    def LOWORD(l)
      l & 0xffff
    end

    #define HIWORD(_dw)     ((WORD)((((DWORD_PTR)(_dw)) >> 16) & 0xffff))
    def HIWORD(l)
      l >> 16
    end

    #define LODWORD(_qw)    ((DWORD)(_qw))

    #define HIDWORD(_qw)    ((DWORD)(((_qw) >> 32) & 0xffffffff))

    #define LOBYTE(w)           ((BYTE)(((DWORD_PTR)(w)) & 0xff))
    def LOBYTE(w)
      w & 0xff
    end

    #define HIBYTE(w)           ((BYTE)((((DWORD_PTR)(w)) >> 8) & 0xff))
    def HIBYTE(w)
      w >> 8
    end

    #define MAKEPOINTS(l) (*((POINTS FAR *)&(l)))
    def MAKEPOINTS(l)

    end
  end
end