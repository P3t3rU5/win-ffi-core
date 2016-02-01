require 'win-ffi/user32'

module WinFFI
  module User32
    # Desktop-specific access flags
    DesktopAccessFlags = enum :desktop_access_flags, [
        :READOBJECTS,     0x0001,
        :CREATEWINDOW,    0x0002,
        :CREATEMENU,      0x0004,
        :HOOKCONTROL,     0x0008,
        :JOURNALRECORD,   0x0010,
        :JOURNALPLAYBACK, 0x0020,
        :ENUMERATE,       0x0040,
        :WRITEOBJECTS,    0x0080,
        :SWITCHDESKTOP,   0x0100
    ]
  end
end