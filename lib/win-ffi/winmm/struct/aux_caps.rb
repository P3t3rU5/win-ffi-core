require 'win-ffi/winmm'

module WinFFI
  module Winmm
    # typedef struct {
    #   WORD      wMid;
    #   WORD      wPid;
    #   MMVERSION vDriverVersion;
    #   TCHAR     szPname[MAXPNAMELEN];
    #   WORD      wTechnology;
    #   WORD      wReserved1;
    #   DWORD     dwSupport;
    # } AUXCAPS;
    class AUXCAPS < FFIStruct
      layout :wMid,           :word,
             :wPid,           :word,
             :vDriverVersion, :mmversion,
             :szPname,        :string,
             :wTechnology,    :word,
             :wReserved1,     :word,
             :dwSupport,      :dword
    end
  end
end