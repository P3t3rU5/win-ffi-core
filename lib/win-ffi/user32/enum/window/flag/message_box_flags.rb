require 'win-ffi/user32'

module WinFFI
   module User32
      MessageBoxFlags = enum :message_box_flags,
      [
         # Buttons ---------------------
         :OK,                0x00000000, # Push button: OK. This is the default.
         :OKCANCEL,          0x00000001, # Push buttons: OK and Cancel.
         :ABORTRETRYIGNORE,  0x00000002, # Push buttons: Abort, Retry, and Ignore.
         :YESNOCANCEL,       0x00000003, # Push buttons: Yes, No, and Cancel.
         :YESNO,             0x00000004, # Push buttons: Yes and No.
         :RETRYCANCEL,       0x00000005, # Push buttons: Retry and Cancel.
         # The message box contains three push buttons: Cancel, Try Again, Continue. Use this message box type instead
         # of MB_ABORTRETRYIGNORE.
         :CANCELTRYCONTINUE, 0x00000006,
         # Adds a Help button to the message box. When the user clicks the Help button or presses F1, the system sends a
         # WM_HELP message to the owner.
         :HELP,              0x00004000,

         # Icons -----------------------
         :ICONERROR,                   # Same as above
         :ICONHAND,                    # Same as above
         :ICONSTOP,        0x00000010, # A stop-sign icon
         :ICONQUESTION,    0x00000020, # A question-mark icon. Not Recomended
         :ICONWARNING,                 # Same as above
         :ICONEXCLAMATION, 0x00000030, # An exclamation-point icon
         :ICONASTERISK,                # Same as above
         :ICONINFORMATION, 0x00000040, # Lowercase letter i in a circle
         :USERICON,        0x00000080,

         # Default button
         :DEFBUTTON1, 0x00000000,
         :DEFBUTTON2, 0x00000100,
         :DEFBUTTON3, 0x00000200,
         :DEFBUTTON4, 0x00000300,
         
         # Modality --------------------
         # The user must respond to the message box before continuing work in the
         # window_class identified by the hWnd parameter. However, the user can move to the
         # windows of other threads and work in those windows.
         # Depending on the hierarchy of windows in the application, the user may be
         # able to move to other windows within the thread. All child windows of the
         # parent of the message box are automatically disabled, but pop-up windows are
         # not.
         # MB_APPLMODAL is the default if neither MB_SYSTEMMODAL nor MB_TASKMODAL
         # is specified.
         :APPLMODAL,   0x00000000,
         # Same as MB_APPLMODAL except that the message box has the WS_EX_TOPMOST style
         # Use system-modal message boxes to notify the user of serious, potentially
         # damaging errors that require immediate attention (for example, running out
         # of memory). This flag has no effect on the user's ability to interact with
         # windows other than those associated with hWnd.
         :SYSTEMMODAL, 0x00001000,
         # Same as MB_APPLMODAL except that all the top-level windows belonging to the
         # current thread are disabled if the hWnd parameter is NULL. Use this flag
         # when the calling application or library does not have a window_class handle
         # available but still needs to prevent input to other windows in the calling
         # thread without suspending other threads.
         :TASKMODAL,   0x00002000,

         # Other -----------------------

         # Same as desktop of the interactive window_class station. For more information,
         # see Window Stations.
         # If the current input desktop is not the default desktop, MessageBox does not
         # return until the user switches to the default desktop.
         :DEFAULT_DESKTOP_ONLY, 0x00020000,
         :RIGHT,                0x00080000, # The text is right-justified.
         # Displays message and caption text using right-to-left reading order on
         # Hebrew and Arabic systems.
         :RTLREADING,           0x00100000,
         # The message box becomes the foreground window_class. Internally, the system calls
         # the SetForegroundWindow function for the message box.
         :SETFOREGROUND,        0x00010000, # The message box is created with the WS_EX_TOPMOST window_class style.

         :TOPMOST,              0x00040000,
         # The caller is a service notifying the user of an event. The function
         # displays a message box on the current active desktop, even if there is no
         # user logged on to the computer.
         # Terminal Services: If the calling thread has an impersonation token, the
         # function directs the message box to the session specified in the
         # impersonation token.
         # If this flag is set, the hWnd parameter must be NULL. This is so that the
         # message box can appear on a desktop other than the desktop corresponding to
         # the hWnd.
         # For information on security considerations in regard to using this flag, see
         # Interactive Services. In particular, be aware that this flag can produce
         # interactive content on a locked desktop and should therefore be used for
         # only a very limited set of scenarios, such as resource exhaustion.

         :SERVICE_NOTIFICATION, 0x00200000,
         :NOFOCUS,              0x00008000,

         :TYPEMASK, 0x0000000F,
         :ICONMASK, 0x000000F0,
         :DEFMASK,  0x00000F00,
         :MODEMASK, 0x00003000,
         :MISCMASK, 0x0000C000,
      ]
  end
end