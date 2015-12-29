module WinFFI
  module Winmm

    # typedef struct {
    #   WORD  wMid;
    #   WORD  wPid;
    #   TCHAR szPname[MAXPNAMELEN];
    #   UINT  wXmin;
    #   UINT  wXmax;
    #   UINT  wYmin;
    #   UINT  wYmax;
    #   UINT  wZmin;
    #   UINT  wZmax;
    #   UINT  wNumButtons;
    #   UINT  wPeriodMin;
    #   UINT  wPeriodMax;
    #   UINT  wRmin;
    #   UINT  wRmax;
    #   UINT  wUmin;
    #   UINT  wUmax;
    #   UINT  wVmin;
    #   UINT  wVmax;
    #   UINT  wCaps;
    #   UINT  wMaxAxes;
    #   UINT  wNumAxes;
    #   UINT  wMaxButtons;
    #   TCHAR szRegKey[MAXPNAMELEN];
    #   TCHAR szOEMVxD[MAX_JOYSTICKOEMVXDNAME];
    # } JOYCAPS;

    class JOYCAPS < FFIStruct
      layout :wMid,        :word,
             :wPid,        :word,
             :szPname,     :string,
             :wXmin,       :uint,
             :wXmax,       :uint,
             :wYmin,       :uint,
             :wYmax,       :uint,
             :wZmin,       :uint,
             :wZmax,       :uint,
             :wNumButtons, :uint,
             :wPeriodMin,  :uint,
             :wPeriodMax,  :uint,
             :wRmin,       :uint,
             :wRmax,       :uint,
             :wUmin,       :uint,
             :wUmax,       :uint,
             :wVmin,       :uint,
             :wVmax,       :uint,
             :wCaps,       :uint,
             :wMaxAxes,    :uint,
             :wNumAxes,    :uint,
             :wMaxButtons, :uint,
             :szRegKey,    :string,
             :szOEMVxD,    :string
    end
  end
end