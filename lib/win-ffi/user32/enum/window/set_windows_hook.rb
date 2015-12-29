require 'win-ffi/user32'

module WinFFI
  module User32
    # SetWindowsHook() codes
    SetWindowsHook = enum :set_windows_hook, [
        :MIN,
        :MSGFILTER,
        :MINHOOK,        -1,
        :JOURNALRECORD,   0,
        :JOURNALPLAYBACK, 1,
        :KEYBOARD,        2,
        :GETMESSAGE,      3,
        :CALLWNDPROC,     4,
        :CBT,             5,
        :SYSMSGFILTER,    6,
        :MOUSE,           7,
        :HARDWARE,        8,
        :DEBUG,           9,
        :SHELL,          10,
        :FOREGROUNDIDLE, 11,
        :CALLWNDPROCRET, 12,
        :KEYBOARD_LL,    13,
        :MOUSE_LL,
        :MAXHOOK,
        :MAX,            14,

    ]
  end
end