require 'win-ffi/winmm/struct/wave_hdr'

module WinFFI
  module Winmm
    # typedef struct wavehdr_tag {
    #   LPSTR              lpData;
    #   DWORD              dwBufferLength;
    #   DWORD              dwBytesRecorded;
    #   DWORD_PTR          dwUser;
    #   DWORD              dwFlags;
    #   DWORD              dwLoops;
    #   struct wavehdr_tag  *lpNext;
    #   DWORD_PTR          reserved;
    # } WAVEHDR, *LPWAVEHDR;
    class WAVEHDR < FFIStruct
      layout :lpData,          :pointer,
             :dwBufferLength,  :dword,
             :dwBytesRecorded, :dword,
             :dwUser,          :pointer,
             :dwFlags,         WHDR,
             :dwLoops,         :dword,
             :lpNext,          :pointer,
             :reserved,        :pointer
    end
  end
end