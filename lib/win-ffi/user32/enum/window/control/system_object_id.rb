require 'win-ffi/user32'

module WinFFI
  module User32
    # Reserved IDs for system objects
    SystemObjectId = enum :system_object_id, [
        :WINDOW,            (0x00000000),
        :SYSMENU,           (0xFFFFFFFF),
        :TITLEBAR,          (0xFFFFFFFE),
        :MENU,              (0xFFFFFFFD),
        :CLIENT,            (0xFFFFFFFC),
        :VSCROLL,           (0xFFFFFFFB),
        :HSCROLL,           (0xFFFFFFFA),
        :SIZEGRIP,          (0xFFFFFFF9),
        :CARET,             (0xFFFFFFF8),
        :CURSOR,            (0xFFFFFFF7),
        :ALERT,             (0xFFFFFFF6),
        :SOUND,             (0xFFFFFFF5),
        :QUERYCLASSNAMEIDX, (0xFFFFFFF4),
        :NATIVEOM,          (0xFFFFFFF0),
    ]
  end
end

