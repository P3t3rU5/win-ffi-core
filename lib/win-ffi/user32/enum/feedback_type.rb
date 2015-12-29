require 'win-ffi/user32'

module WinFFI
  module User32
    FEEDBACK_TYPE = enum :feedback_type,
    [
      :TOUCH_CONTACTVISUALIZATION, 1,
      :PEN_BARRELVISUALIZATION,    2,
      :PEN_TAP,                    3,
      :PEN_DOUBLETAP,              4,
      :PEN_PRESSANDHOLD,           5,
      :PEN_RIGHTTAP,               6,
      :TOUCH_TAP,                  7,
      :TOUCH_DOUBLETAP,            8,
      :TOUCH_PRESSANDHOLD,         9,
      :TOUCH_RIGHTTAP,             10,
      :GESTURE_PRESSANDTAP,        11,
      :MAX,                        0xFFFFFFFF
    ]
  end
end