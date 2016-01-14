require 'win-ffi/user32'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/hh707350(v=vs.85).aspx
    FEEDBACK_TYPE = enum :feedback_type, [
        :TOUCH_CONTACTVISUALIZATION,  1, # touch contact event.
        :PEN_BARRELVISUALIZATION,     2, # pen barrel-button event.
        :PEN_TAP,                     3, # pen tap event.
        :PEN_DOUBLETAP,               4, # pen double-tap event.
        :PEN_PRESSANDHOLD,            5, # pen press-and-hold event.
        :PEN_RIGHTTAP,                6, # pen right-tap event.
        :TOUCH_TAP,                   7, # touch tap event.
        :TOUCH_DOUBLETAP,             8, # touch double-tap event.
        :TOUCH_PRESSANDHOLD,          9, # touch press-and-hold event.
        :TOUCH_RIGHTTAP,             10, # touch right-tap event.
        :GESTURE_PRESSANDTAP,        11, # press-and-tap gesture.
        :MAX,                0xFFFFFFFF  # Do not use.
    ]
  end
end