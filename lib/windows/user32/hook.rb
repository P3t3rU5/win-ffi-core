module WinFFI
  module User32
    module Hook
      extend LibBase

      ffi_lib 'user32'

      WindowHook = enum :window_hook, [
          :MSGFILTER, -1, # Installs a hook procedure that monitors messages generated as a result of an input event in a
          # dialog box, message box, menu, or scroll bar. For more information, see the MessageProc hook procedure.

          :JOURNALRECORD, 0, # Installs a hook procedure that records input messages posted to the system message queue.
          # This hook is useful for recording macros. For more information, see the JournalRecordProc hook procedure.

          :JOURNALPLAYBACK, 1, # Installs a hook procedure that posts messages previously recorded by a :JOURNALRECORD
          # hook procedure. For more information, see the JournalPlaybackProc hook procedure.

          :KEYBOARD, 2, # Installs a hook procedure that monitors keystroke messages. For more information, see the
          # KeyboardProc hook procedure.

          :GETMESSAGE, 3, # Installs a hook procedure that monitors messages posted to a message queue. For more
          # information, see the GetMsgProc hook procedure.

          :CALLWNDPROC, 4, # Installs a hook procedure that monitors messages before the system sends them to the
          # destination window procedure. For more information, see the CallWndProc hook procedure.

          :CBT, 5, # Installs a hook procedure that receives notifications useful to a CBT application. For more
          # information, see the CBTProc hook procedure.

          :SYSMSGFILTER, 6, # Installs a hook procedure that monitors messages generated as a result of an input event in
          # a dialog box, message box, menu, or scroll bar. The hook procedure monitors these messages for all
          # applications in the same desktop as the calling thread. For more information, see the SysMsgProc hook
          # procedure.

          :MOUSE, 7, # Installs a hook procedure that monitors mouse messages. For more information, see the MouseProc
          # hook procedure.

          :DEBUG, 9, # Installs a hook procedure useful for debugging other hook procedures. For more information, see the
          # DebugProc hook procedure.

          :SHELL, 10, # Installs a hook procedure that receives notifications useful to shell applications. For more
          # information, see the ShellProc hook procedure.

          :FOREGROUNDIDLE, 11, # Installs a hook procedure that will be called when the application's foreground thread is
          # about to become idle. This hook is useful for performing low priority tasks during idle time. For more
          # information, see the ForegroundIdleProc hook procedure.

          :CALLWNDPROCRET, 12, # Installs a hook procedure that monitors messages after they have been processed by the
          # destination window procedure. For more information, see the CallWndRetProc hook procedure.

          :KEYBOARD_LL, 13, # Installs a hook procedure that monitors low-level keyboard input events. For more
          # information, see the LowLevelKeyboardProc hook procedure.

          :MOUSE_LL, 14, # Installs a hook procedure that monitors low-level mouse input events. For more information, see
                         # the LowLevelMouseProc hook procedure.
      ]

      #BOOL WINAPI CallMsgFilter(
      #  _In_  LPMSG lpMsg,
      #  _In_  int nCode )
      attach_function 'CallMsgFilterA', [MSG.ptr, :int], :bool
      attach_function 'CallMsgFilterW', [MSG.ptr, :int], :bool

      #LRESULT WINAPI CallNextHookEx(
      #  _In_opt_  HHOOK hhk,
      #  _In_      int nCode,
      #  _In_      WPARAM wParam,
      #  _In_      LPARAM lParam )
      attach_function 'CallNextHookEx', [:pointer, :int, :wparam, :lparam], :lresult

      #TODO
      #LRESULT CALLBACK CallWndProc(
      #  _In_  int nCode,
      #  _In_  WPARAM wParam,
      #  _In_  LPARAM lParam )

      #TODO
      #LRESULT CALLBACK CallWndRetProc(
      #  _In_  int nCode,
      #  _In_  WPARAM wParam,
      #  _In_  LPARAM lParam )

      #TODO
      #LRESULT CALLBACK CBTProc(
      #  _In_  int nCode,
      #  _In_  WPARAM wParam,
      #  _In_  LPARAM lParam )

      #TODO
      #LRESULT CALLBACK DebugProc(
      #  _In_  int nCode,
      #  _In_  WPARAM wParam,
      #  _In_  LPARAM lParam )

      #TODO
      #DWORD CALLBACK ForegroundIdleProc(
      #  _In_  int code,
      #  DWORD wParam,
      #  LONG lParam )

      #TODO
      #LRESULT CALLBACK GetMsgProc(
      #  _In_  int code,
      #  _In_  WPARAM wParam,
      #  _In_  LPARAM lParam )

      #TODO
      #LRESULT CALLBACK JournalPlaybackProc(
      #  _In_  int code,
      #  WPARAM wParam,
      #  _In_  LPARAM lParam )

      #TODO
      #LRESULT CALLBACK JournalRecordProc(
      #  _In_  int code,
      #  WPARAM wParam,
      #  _In_  LPARAM lParam )

      #TODO
      #LRESULT CALLBACK KeyboardProc(
      #  _In_  int code,
      #  _In_  WPARAM wParam,
      #  _In_  LPARAM lParam )

      #TODO
      #LRESULT CALLBACK LowLevelKeyboardProc(
      #  _In_  int nCode,
      #  _In_  WPARAM wParam,
      #  _In_  LPARAM lParam )

      #TODO
      #LRESULT CALLBACK LowLevelMouseProc(
      #  _In_  int nCode,
      #  _In_  WPARAM wParam,
      #  _In_  LPARAM lParam )

      #TODO
      #LRESULT CALLBACK MessageProc(
      #  _In_  int code,
      #  WPARAM wParam,
      #  _In_  LPARAM lParam )

      #TODO
      #LRESULT CALLBACK MouseProc(
      #  _In_  int nCode,
      #  _In_  WPARAM wParam,
      #  _In_  LPARAM lParam )

      #HHOOK WINAPI SetWindowsHookEx(
      #  _In_  int idHook,
      #  _In_  HOOKPROC lpfn,
      #  _In_  HINSTANCE hMod,
      #  _In_  DWORD dwThreadId )
      attach_function 'SetWindowsHookExA', [WindowHook, :pointer, :pointer, :dword], :pointer
      attach_function 'SetWindowsHookExW', [WindowHook, :pointer, :pointer, :dword], :pointer

      #TODO
      #LRESULT CALLBACK ShellProc(
      #  _In_  int nCode,
      #  _In_  WPARAM wParam,
      #  _In_  LPARAM lParam )

      #TODO
      #LRESULT CALLBACK SysMsgProc(
      #  _In_  int nCode,
      #  WPARAM wParam,
      #  _In_  LPARAM lParam )

      #BOOL WINAPI UnhookWindowsHookEx( _In_  HHOOK hhk )
      attach_function 'UnhookWindowsHookEx', [:pointer], :bool

    end
  end
end