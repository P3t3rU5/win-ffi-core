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
    #   DWORD     dwSupport;
    # } WAVEOUTCAPS;
    class WAVEOUTCAPS < FFIStruct
      layout :wMid,           :word,
             :wPid,           :word,
             :vDriverVersion, :mmversion,
             :szPname,        :string,
             :dwFormats,      :dword,
             :wChannels,      :word,
             :wReserved1,     :word,
             :dwSupport,      :dword
    end
  end
end