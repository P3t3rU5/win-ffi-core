module WinFFI
  module User32
    SystemMenuComand = enum :system_menu_command,
    [
        :SIZE,         0xF000,
        :MOVE,         0xF010,
        :MINIMIZE,     0xF020,
        :MAXIMIZE,     0xF030,
        :NEXTWINDOW,   0xF040,
        :PREVWINDOW,   0xF050,
        :CLOSE,        0xF060,
        :VSCROLL,      0xF070,
        :HSCROLL,      0xF080,
        :MOUSEMENU,    0xF090,
        :KEYMENU,      0xF100,
        :ARRANGE,      0xF110,
        :RESTORE,      0xF120,
        :TASKLIST,     0xF130,
        :SCREENSAVE,   0xF140,
        :HOTKEY,       0xF150,
        :DEFAULT,      0xF160,
        :MONITORPOWER, 0xF170,
        :CONTEXTHELP,  0xF180,
        :SEPARATOR,    0xF00F,
    ]

    #if(WINVER >= 0x0600)
    #define SCF_ISSECURE    0x00000001
    #endif /* WINVER >= 0x0600 */
    if WindowsVersion >= :vista
      SystemMenuComand.instance_variable_get(:@kv_map)[:ISSECURE]  = 0x00000001
      SystemMenuComand.instance_variable_get(:@kv_map)[0x00000001] = :ISSECURE
    end
  end
end