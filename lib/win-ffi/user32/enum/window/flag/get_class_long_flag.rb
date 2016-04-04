require 'win-ffi/user32'

module WinFFI
  module User32
    # User32::ClassLong
    # Class Field Offsets
    GetClassLongFlag = enum :get_class_long_flag,
    [
      :MENUNAME,       -8, #Replaces the address of the menu name string. The string identifies the menu resource
      # associated with the class.

      :HBRBACKGROUND, -10, #Replaces a handle to the background brush associated with the class.

      :HCURSOR,       -12, #Replaces a handle to the cursor associated with the class.

      :HICON,         -14, #Replaces a handle to the icon associated with the class.

      :HMODULE,       -16, #Replaces a handle to the module that registered the class.

      :CBWNDEXTRA,    -18, #Sets the size, in bytes, of the extra window_class memory associated with each window_class
      # in the class. Setting this value does not change the number of extra bytes already allocated. For information on
      # how to access this memory, see SetWindowLong.

      :CBCLSEXTRA,    -20, #Sets the size, in bytes, of the extra memory associated with the class. Setting this
      # value does not change  the number of extra bytes already allocated.

      :WNDPROC,       -24, #Replaces the address of the window_class procedure associated with the class.

      :STYLE,         -26, #Replaces the window_class-class style bits.

      :ATOM,          -32,

      :HICONSM,       -34, #Replace a handle to the small icon associated with the class.
    ]
  end
end