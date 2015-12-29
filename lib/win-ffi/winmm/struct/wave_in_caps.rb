require 'win-ffi/winmm'

module WinFFI
  module Winmm
    # typedef struct {
    #   WORD      wMid;
    #   WORD      wPid;
    #   MMVERSION vDriverVersion;
    #   TCHAR     szPname[MAXPNAMELEN];
    #   DWORD     dwFormats;
    #   WORD      wChannels;
    #   WORD      wReserved1;
    # } WAVEINCAPS;
    class WAVEINCAPS < FFIStruct
      layout :wMid,           :word,
             :wPid,           :word,
             :vDriverVersion, :mmversion,
             :szPname,        :string,
             :dwFormats,      :dword,
             :wChannels,      :word,
             :wReserved1,     :word
    end
  end
end