module WinFFI
  module Winmm
    # typedef struct joyinfoex_tag {
    #   DWORD dwSize;
    #   DWORD dwFlags;
    #   DWORD dwXpos;
    #   DWORD dwYpos;
    #   DWORD dwZpos;
    #   DWORD dwRpos;
    #   DWORD dwUpos;
    #   DWORD dwVpos;
    #   DWORD dwButtons;
    #   DWORD dwButtonNumber;
    #   DWORD dwPOV;
    #   DWORD dwReserved1;
    #   DWORD dwReserved2;
    # } JOYINFOEX;
    class JOYINFOEX < FFIStruct
      layout :dwSize,         :dword,
             :dwFlags,        :dword,
             :dwXpos,         :dword,
             :dwYpos,         :dword,
             :dwZpos,         :dword,
             :dwRpos,         :dword,
             :dwUpos,         :dword,
             :dwVpos,         :dword,
             :dwButtons,      :dword,
             :dwButtonNumber, :dword,
             :dwPOV,          :dword,
             :dwReserved1,    :dword,
             :dwReserved2,    :dword
    end
  end
end
