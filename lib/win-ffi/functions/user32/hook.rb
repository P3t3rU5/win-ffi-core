require 'win-ffi/functions/user32'

require 'win-ffi/enums/user32/window_hook'

require 'win-ffi/structs/user32/msg'

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

    #LRESULT CALLBACK CallWndProc(
    #  _In_  int nCode,
    #  _In_  WPARAM wParam,
    #  _In_  LPARAM lParam )
    CallWndProc = callback :CallWndProc, [:int, :wparma, :lparam], :lresult

    #LRESULT CALLBACK CallWndRetProc(
    #  _In_  int nCode,
    #  _In_  WPARAM wParam,
    #  _In_  LPARAM lParam )
    CallWndRetProc = callback :CallWndRetProc, [:int, :wparma, :lparam], :lresult

    #LRESULT CALLBACK CBTProc(
    #  _In_  int nCode,
    #  _In_  WPARAM wParam,
    #  _In_  LPARAM lParam )
    CBTProc = callback :CBTProc, [:int, :wparma, :lparam], :lresult

    #LRESULT CALLBACK DebugProc(
    #  _In_  int nCode,
    #  _In_  WPARAM wParam,
    #  _In_  LPARAM lParam )
    DebugProc = callback :DebugProc, [:int, :wparma, :lparam], :lresult

    #DWORD CALLBACK ForegroundIdleProc(
    #  _In_  int code,
    #  DWORD wParam,
    #  LONG lParam )
    ForegroundIdleProc = callback :ForegroundIdleProc, [:int, :wparma, :lparam], :lresult

    #LRESULT CALLBACK GetMsgProc(
    #  _In_  int code,
    #  _In_  WPARAM wParam,
    #  _In_  LPARAM lParam )
    GetMsgProc = callback :GetMsgProc, [:int, :wparma, :lparam], :lresult

    #LRESULT CALLBACK JournalPlaybackProc(
    #  _In_  int code,
    #  WPARAM wParam,
    #  _In_  LPARAM lParam )
    JournalPlaybackProc = callback :JournalPlaybackProc, [:int, :wparma, :lparam], :lresult

    #LRESULT CALLBACK JournalRecordProc(
    #  _In_  int code,
    #  WPARAM wParam,
    #  _In_  LPARAM lParam )
    JournalRecordProc = callback :JournalRecordProc, [:int, :wparma, :lparam], :lresult

    #LRESULT CALLBACK KeyboardProc(
    #  _In_  int code,
    #  _In_  WPARAM wParam,
    #  _In_  LPARAM lParam )
    KeyboardProc = callback :KeyboardProc, [:int, :wparma, :lparam], :lresult

    #LRESULT CALLBACK LowLevelKeyboardProc(
    #  _In_  int nCode,
    #  _In_  WPARAM wParam,
    #  _In_  LPARAM lParam )
    LowLevelKeyboardProc = callback :LowLevelKeyboardProc, [:int, :wparma, :lparam], :lresult

    #LRESULT CALLBACK LowLevelMouseProc(
    #  _In_  int nCode,
    #  _In_  WPARAM wParam,
    #  _In_  LPARAM lParam )
    LowLevelMouseProc = callback :LowLevelMouseProc, [:int, :wparma, :lparam], :lresult

    #LRESULT CALLBACK MessageProc(
    #  _In_  int code,
    #  WPARAM wParam,
    #  _In_  LPARAM lParam )
    MessageProc = callback :MessageProc, [:int, :wparma, :lparam], :lresult

    #LRESULT CALLBACK MouseProc(
    #  _In_  int nCode,
    #  _In_  WPARAM wParam,
    #  _In_  LPARAM lParam )
    MouseProc = callback :MouseProc, [:int, :wparma, :lparam], :lresult

    #HHOOK WINAPI SetWindowsHookEx(
    #  _In_  int idHook,
    #  _In_  HOOKPROC lpfn,
    #  _In_  HINSTANCE hMod,
    #  _In_  DWORD dwThreadId )
    attach_function 'SetWindowsHookExA', [WindowHook, :pointer, :pointer, :dword], :pointer
    attach_function 'SetWindowsHookExW', [WindowHook, :pointer, :pointer, :dword], :pointer

    #LRESULT CALLBACK ShellProc(
    #  _In_  int nCode,
    #  _In_  WPARAM wParam,
    #  _In_  LPARAM lParam )
    ShellProc = callback :ShellProc, [:int, :wparma, :lparam], :lresult

    #LRESULT CALLBACK SysMsgProc(
    #  _In_  int nCode,
    #  WPARAM wParam,
    #  _In_  LPARAM lParam )
    SysMsgProc = callback :SysMsgProc, [:int, :wparma, :lparam], :lresult

    #BOOL WINAPI UnhookWindowsHookEx( _In_  HHOOK hhk )
    attach_function 'UnhookWindowsHookEx', [:pointer], :bool
  end
end