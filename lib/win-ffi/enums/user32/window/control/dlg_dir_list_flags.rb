require 'win-ffi/enums/user32'

module WinFFI
  module User32
    DlgDirListFlags = enum :dlg_dir_list_flags, [
        :READWRITE, 0x0000,
        :READONLY,  0x0001,
        :HIDDEN,    0x0002,
        :SYSTEM,    0x0004,
        :DIRECTORY, 0x0010,
        :ARCHIVE,   0x0020,

        :POSTMSGS,  0x2000,
        :DRIVES,    0x4000,
        :EXCLUSIVE, 0x8000,
    ]
  end
end