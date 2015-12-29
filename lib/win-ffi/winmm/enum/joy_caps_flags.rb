require 'win-ffi/winmm'

module WinFFI
  module Winmm
    JoyCapsFlags = enum :joy_caps_flags, [
        :HASZ,	  # Joystick has z-coordinate information.
        :HASR,	  # Joystick has rudder (fourth axis) information.
        :HASU,	  # Joystick has u-coordinate (fifth axis) information.
        :HASV,    # Joystick has v-coordinate (sixth axis) information.
        :HASPOV,  # Joystick has point-of-view information.
        :POV4DIR, # Joystick point-of-view supports discrete values (centered, forward, backward, left, and right).
        :POVCTS , # Joystick point-of-view supports continuous degree bearings.
    ]
  end
end