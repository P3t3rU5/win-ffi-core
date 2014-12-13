module WinFFI
  module User32
    module Dialog
      MessageBoxFlags = enum :message_box_flags, [
         # Buttons ---------------------

         :abortretryignore,  0x00000002, # Push buttons: Abort, Retry, and Ignore.
         # The message box contains three push buttons: Cancel, Try Again, Continue. Use this message box type instead of MB_ABORTRETRYIGNORE.
         :canceltrycontinue, 0x00000006,
         # Adds a Help button to the message box. When the user clicks the Help button or presses F1, the system sends a
         # WM_HELP message to the owner.
         :help,              0x00004000,
         :ok,                0x00000000, # Push button: OK. This is the default.
         :okcancel,          0x00000001, # Push buttons: OK and Cancel.
         :retrycancel,       0x00000005, # Push buttons: Retry and Cancel.
         :yesno,             0x00000004, # Push buttons: Yes and No.
         :yesnocancel,       0x00000003, # Push buttons: Yes, No, and Cancel.

         # Icons -----------------------

         :iconexclamation, 0x00000030, # An exclamation-point icon
         :iconwarning,     0x00000030, # Same as above
         :iconinformation, 0x00000040, # Lowercase letter i in a circle
         :iconasterisk,    0x00000040, # Same as above
         :iconquestion,    0x00000020, # A question-mark icon. Not Recomended
         :iconstop,        0x00000010, # A stop-sign icon
         :iconerror,       0x00000010, # Same as above
         :iconhand,        0x00000010, # Same as above

         # Modality --------------------

         # The user must respond to the message box before continuing work in the
         # window identified by the hWnd parameter. However, the user can move to the
         # windows of other threads and work in those windows.
         # Depending on the hierarchy of windows in the application, the user may be
         # able to move to other windows within the thread. All child windows of the
         # parent of the message box are automatically disabled, but pop-up windows are
         # not.
         # MB_APPLMODAL is the default if neither MB_SYSTEMMODAL nor MB_TASKMODAL
         # is specified.
         :applmodal,   0x00000000,
         # Same as MB_APPLMODAL except that the message box has the WS_EX_TOPMOST style
         # Use system-modal message boxes to notify the user of serious, potentially
         # damaging errors that require immediate attention (for example, running out
         # of memory). This flag has no effect on the user's ability to interact with
         # windows other than those associated with hWnd.
         :systemmodal, 0x00001000,
         # Same as MB_APPLMODAL except that all the top-level windows belonging to the
         # current thread are disabled if the hWnd parameter is NULL. Use this flag
         # when the calling application or library does not have a window handle
         # available but still needs to prevent input to other windows in the calling
         # thread without suspending other threads.
         :taskmodal,   0x00002000,

         # Other -----------------------

         # Same as desktop of the interactive window station. For more information,
         # see Window Stations.
         # If the current input desktop is not the default desktop, MessageBox does not
         # return until the user switches to the default desktop.
         :default_desktop_only, 0x00020000,
         :right,                0x00080000, # The text is right-justified.
         # Displays message and caption text using right-to-left reading order on
         # Hebrew and Arabic systems.
         :rtlreading,           0x00100000,
         # The message box becomes the foreground window. Internally, the system calls
         # the SetForegroundWindow function for the message box.
         :setforeground,        0x00010000, # The message box is created with the WS_EX_TOPMOST window style.

         :topmost,              0x00040000,
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

         :service_notification, 0x00200000,
      ]

      MessageBoxReturn = enum :message_box_return, [
         :OK,        1, # The OK button was selected.
         :CANCEL,    2, # The Cancel button was selected.
         :ABORT,     3, # The Abort button was selected.
         :RETRY,     4, # The Retry button was selected.
         :IGNORE,    5, # The Ignore button was selected.
         :YES,       6, # The Yes button was selected.
         :NO,        7, # The No button was selected.
         :TRYAGAIN, 10, # The Try Again button was selected.
         :CONTINUE, 11 # The Continue button was selected.
      ]
    end
  end
end