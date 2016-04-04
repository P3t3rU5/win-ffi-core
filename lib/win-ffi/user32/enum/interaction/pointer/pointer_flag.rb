require 'win-ffi/user32'

module WinFFI
  module User32
    if WindowsVersion >= 8
      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh969211(v=vs.85).aspx
      PointerFlag = enum :pointer_flag, [
        :NONE,    0x00000000, # Default
        :NEW,     0x00000001, # Indicates the arrival of a new pointer.
        :INRANGE, 0x00000002, # Indicates that this pointer continues to exist. When this flag is not set,
        # it indicates the pointer has left detection range. This flag is typically not set only when a hovering pointer
        # leaves detection range (POINTER_FLAG_UPDATE is set) or when a pointer in contact with a window_class surface leaves
        # detection range (POINTER_FLAG_UP is set).
        :INCONTACT, 0x00000004, #Indicates that this pointer is in contact with the digitizer surface.
        # When this flag is not set, it indicates a hovering pointer.
        :FIRSTBUTTON, 0x00000010, # Indicates a primary action, analogous to a left mouse button down.
        #A touch pointer has this flag set when it is in contact with the digitizer surface.
        #A pen pointer has this flag set when it is in contact with the digitizer surface with no buttons pressed.
        #A mouse pointer has this flag set when the left mouse button is down.
        :SECONDBUTTON, 0x00000020, # Indicates a secondary action, analogous to a right mouse button down.
        #A touch pointer does not use this flag. A pen pointer has this flag set when it is in contact with the
        # digitizer surface with the pen barrel button pressed.A mouse pointer has this flag set when the right mouse
        # button is down.
        :THIRDBUTTON, 0x00000040, # Analogous to a mouse wheel button down. A touch pointer does not use
        # this flag. A pen pointer does not use this flag. A mouse pointer has this flag set when the mouse wheel button
        # is down.
        :FOURTHBUTTON, 0x00000080, # Analogous to a first extended mouse (XButton1) button down.
        # A touch pointer does not use this flag.
        # A pen pointer does not use this flag.
        # A mouse pointer has this flag set when the first extended mouse (XBUTTON1) button is down.
        :FIFTHBUTTON, 0x00000100, # Analogous to a second extended mouse (XButton2) button down.
        # A touch pointer does not use this flag.
        # A pen pointer does not use this flag.
        # A mouse pointer has this flag set when the second extended mouse (XBUTTON2) button is down.
        :PRIMARY, 0x00002000, # Indicates that this pointer has been designated as the primary pointer.
        # A primary pointer is a single pointer that can perform actions beyond those available to non-primary pointers.
        # For example, when a primary pointer makes contact with a window_class’s surface, it may provide the window_class an
        # opportunity to activate by sending it a WM_POINTERACTIVATE message. The primary pointer is identified from all
        # current user interactions on the system (mouse, touch, pen, and so on). As such, the primary pointer might not
        # be associated with your app. The first contact in a multi-touch interaction is set as the primary pointer.
        # Once a primary pointer is identified, all contacts must be lifted before a new contact can be identified as a
        # primary pointer. For apps that don't process pointer input, only the primary pointer's events are promoted to
        # mouse events.
        :CONFIDENCE, 0x000004000, # Confidence is a suggestion from the source device about whether the
        # pointer represents an intended or accidental interaction, which is especially relevant for PT_TOUCH pointers
        # where an accidental interaction (such as with the palm of the hand) can trigger input. The presence of this
        # flag indicates that the source device has high confidence that this input is part of an intended interaction.
        :POINTER_FLAG_CANCELED, 0x000008000, #Indicates that the pointer is departing in an abnormal manner, such as
        # when the system receives invalid input for the pointer or when a device with active pointers departs abruptly.
        # If the application receiving the input is in a position to do so, it should treat the interaction as not
        # completed and reverse any effects of the concerned pointer.
        :DOWN, 0x00010000, # Indicates that this pointer transitioned to a down state; that is, it made
        # contact with the digitizer surface.
        :UPDATE, 0x00020000, # Indicates that this is a simple update that does not include pointer state
        # changes.
        :PUP, 0x00040000, # Indicates that this pointer transitioned to an up state; that is, it broke
        # contact with the digitizer surface.
        :WHEEL, 0x00080000, # Indicates input associated with a pointer wheel. For mouse pointers, this is
        # equivalent to the action of the mouse scroll wheel (WM_MOUSEWHEEL).
        :HWHEEL, 0x00100000, # Indicates input associated with a pointer h-wheel. For mouse pointers, this
        # is equivalent to the action of the mouse horizontal scroll wheel (WM_MOUSEHWHEEL).
        :CAPTURECHANGED, 0x00200000, # Indicates that this pointer was captured by (associated with)
        # another element and the original element has lost capture (see WM_POINTERCAPTURECHANGED)
        :HASTRANSFORM, 0x00400000 #Indicates that this pointer has an associated transform.
      ]
    end
  end
end