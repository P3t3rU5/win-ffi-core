module WinFFI
  module User32
    # MENUGETOBJECTINFO dwFlags values
    GetMenuDefaultItemFlags = get_menu_default_item, [
        :USEDISABLED,  0x0001,
        :GOINTOPOPUPS, 0x0002
    ]
  end
end