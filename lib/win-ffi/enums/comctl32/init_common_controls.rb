require 'win-ffi/enums/comctl32'

module WinFFI
  module Comctl32
    InitCommonControls = enum :init_common_controls,
    [
      :LISTVIEW_CLASSES,   0x00000001,
      :TREEVIEW_CLASSES,   0x00000002,
      :BAR_CLASSES,        0x00000004,
      :TAB_CLASSES,        0x00000008,
      :UPDOWN_CLASS,       0x00000010,
      :PROGRESS_CLASS,     0x00000020,
      :HOTKEY_CLASS,       0x00000040,
      :ANIMATE_CLASS,      0x00000080,
      :WIN95_CLASSES,      0x000000FF,
      :DATE_CLASSES,       0x00000100,
      :USEREX_CLASSES,     0x00000200,
      :COOL_CLASSES,       0x00000400,
      :INTERNET_CLASSES,   0x00000800,
      :PAGESCROLLER_CLASS, 0x00001000,
      :NATIVEFNTCTL_CLASS, 0x00002000,
      :STANDARD_CLASSES,   0x00004000,
      :LINK_CLASS,         0x00008000
    ]
    if WindowsVersion >= :xp
      InitCommonControls.instance_variable_get(:@kv_map)[:STANDARD_CLASSES] = 0x00004000
      InitCommonControls.instance_variable_get(:@kv_map)[:LINK_CLASS]       = 0x00008000
      InitCommonControls.instance_variable_get(:@vk_map)[0x00004000] = :STANDARD_CLASSES
      InitCommonControls.instance_variable_get(:@vk_map)[0x00008000] = :LINK_CLASS
    end
  end
end