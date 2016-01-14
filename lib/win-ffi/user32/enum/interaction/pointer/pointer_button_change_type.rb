module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/jj653868(v=vs.85).aspx
    POINTER_BUTTON_CHANGE_TYPE = enum :pointer_button_change_type, [
        :NONE,
        :FIRSTBUTTON_DOWN,
        :FIRSTBUTTON_UP,
        :SECONDBUTTON_DOWN,
        :SECONDBUTTON_UP,
        :THIRDBUTTON_DOWN,
        :THIRDBUTTON_UP,
        :FOURTHBUTTON_DOWN,
        :FOURTHBUTTON_UP,
        :FIFTHBUTTON_DOWN,
        :FIFTHBUTTON_UP
    ]
  end
end