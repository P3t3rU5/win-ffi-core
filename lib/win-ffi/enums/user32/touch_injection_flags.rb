require 'win-ffi/enums/user32'

module WinFFI
  module User32
    TouchInjectionFlags = enum :touch_injection_flags,
    [
      :TOUCH_FEEDBACK_DEFAULT, 0x1, # Specifies default touch visualizations.
      :TOUCH_FEEDBACK_INDIRECT, 0x2, # Specifies indirect touch visualizations.
      :TOUCH_FEEDBACK_NONE, 0x3, # Specifies no touch visualizations.
      :MAX_TOUCH_COUNT, 256, # Specifies the maximum number of simultaneous contacts.
    ]
  end
end