require 'win-ffi/user32'

module WinFFI
  module User32
    # GetDCEx() flags
    GetDCExFlags = enum :get_dc_ex_flags, [
        :WINDOW,           0x00000001,
        :CACHE,            0x00000002,
        :NORESETATTRS,     0x00000004,
        :CLIPCHILDREN,     0x00000008,
        :CLIPSIBLINGS,     0x00000010,
        :PARENTCLIP,       0x00000020,
        :EXCLUDERGN,       0x00000040,
        :INTERSECTRGN,     0x00000080,
        :EXCLUDEUPDATE,    0x00000100,
        :INTERSECTUPDATE,  0x00000200,
        :LOCKWINDOWUPDATE, 0x00000400,

        :VALIDATE,         0x00200000,
    ]
  end
end