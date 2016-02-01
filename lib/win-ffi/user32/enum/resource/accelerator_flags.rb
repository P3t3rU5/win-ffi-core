module WinFFI
  module User32
    # Defines for the fVirt field of the Accelerator table structure.
    FVIRTKEY = TRUE # The key member specifies a virtual-key code. If this flag is not specified, key is assumed to
    # specify a character code.
    AcceleratorFlags = enum :accelerator_flags, [
        :NOINVERT, 0x02, # No top-level menu item is highlighted when the accelerator is used. If this flag is not
        # specified, a top-level menu item will be highlighted, if possible, when the accelerator is used. This
        # attribute is obsolete and retained only for backward compatibility with resource files designed for 16-bit
        # Windows.
        :SHIFT,    0x04, # The SHIFT key must be held down when the accelerator key is pressed.
        :CONTROL,  0x08, # The CTRL key must be held down when the accelerator key is pressed.
        :ALT,      0x10  # The ALT key must be held down when the accelerator key is pressed.
    ]
  end
end