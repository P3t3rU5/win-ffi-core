require_relative '../../enums/user32/window_hook'

require_relative '../../structs/user32/msg'

module WinFFI
  module User32
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