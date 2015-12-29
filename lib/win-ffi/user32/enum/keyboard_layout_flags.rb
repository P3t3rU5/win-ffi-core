require 'win-ffi/user32'

module WinFFI
  module User32
    KeyboardLayoutFlags = enum :keyboard_layout_flags,
    [
      :ACTIVATE, 0x00000001, # If the specified input locale identifier is not already loaded, the function loads
      # and activates the input locale identifier for the current thread.

      :SUBSTITUTE_OK, 0x00000002, # Substitutes the specified input locale identifier with another locale preferred
      # by the user. The system starts with this flag set, and it is recommended that your application always use
      # this flag. The substitution occurs only if the registry key HKEY_CURRENT_USER\Keyboard\Layout\Substitutes
      # explicitly defines a substitution locale. For example, if the key includes the value name "00000409" with
      # value "00010409", loading the U.S. English layout ("00000409") causes the Dvorak U.S. English layout
      # ("00010409") to be loaded instead. The system uses :SUBSTITUTE_OK when booting, and it is recommended that
      # all applications use this value when loading input locale identifiers to ensure that the user's preference
      # is selected.

      :REORDER, 0x00000008, # If this bit is set, the system's circular list of loaded locale identifiers is
      # reordered by moving the locale identifier to the head of the list. If this bit is not set, the list is rotated
      # without a change of order. For example, if a user had an English locale identifier active, as well as having
      # French, German, and Spanish locale identifiers loaded (in that order), then activating the German locale
      # identifier with the KLF_REORDER bit set would produce the following order: German, English, French, Spanish.
      # Activating the German locale identifier without the KLF_REORDER bit set would produce the following order:
      # German, Spanish, English, French. If less than three locale identifiers are loaded, the value of this flag is
      # irrelevant.

      :REPLACELANG, 0x00000010, # If the new input locale identifier has the same language identifier as a current
      # input locale identifier, the new input locale identifier replaces the current one as the input locale
      # identifier for that language. If this value is not provided and the input locale identifiers have the same
      # language identifiers, the current input locale identifier is not replaced and the function returns NULL.

      :NOTELLSHELL, 0x00000080, # Prevents a ShellProc hook procedure from receiving an HSHELL_LANGUAGE hook code when
      # the new input locale identifier is loaded. This value is typically used when an application loads multiple
      # input locale identifiers one after another. Applying this value to all but the last input locale identifier
      # delays the shell's processing until all input locale identifiers have been added.


      :SETFORPROCESS, 0x00000100, #This flag is valid only with :ACTIVATE. Activates the specified input locale
      # identifier for the entire process and sends the WM_INPUTLANGCHANGE message to the current thread's Focus or
      # Active window. Typically, LoadKeyboardLayout activates an input locale identifier only for the current thread.

      :SHIFTLOCK, 0x00010000, # This is used with KLF_RESET. See KLF_RESET for an explanation.
      #KLF_UNLOADPREVIOUS #This flag is unsupported. Use the UnloadKeyboardLayout function instead.

      :RESET, 0x40000000, # If set but KLF_SHIFTLOCK is not set, the Caps Lock state is turned off by pressing the
      # Caps Lock key again. If set and KLF_SHIFTLOCK is also set, the Caps Lock state is turned off by pressing
      # either SHIFT key. These two methods are mutually exclusive, and the setting persists as part of the User's
      # profile in the registry.
    ]





  end
end