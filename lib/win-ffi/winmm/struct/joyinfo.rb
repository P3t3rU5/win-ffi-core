module WinFFI
  module Winmm
    # typedef struct {
    #   UINT wXpos;
    #   UINT wYpos;
    #   UINT wZpos;
    #   UINT wButtons;
    # } JOYINFO;
    class JOYINFO < FFIStruct
      layout :wXpos,    :uint,
             :wYpos,    :uint,
             :wZpos,    :uint,
             :wButtons, :uint
    end
  end
end

