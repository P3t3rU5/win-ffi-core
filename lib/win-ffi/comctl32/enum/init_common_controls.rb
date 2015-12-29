require 'win-ffi/comctl32'

module WinFFI
  module Comctl32
    buffer = [
        :LISTVIEW_CLASSES,   0x00000001, # listview, header
        :TREEVIEW_CLASSES,   0x00000002, # treeview, tooltips
        :BAR_CLASSES,        0x00000004, # toolbar, statusbar, track
        :TAB_CLASSES,        0x00000008, # tab, tooltips
        :UPDOWN_CLASS,       0x00000010, # updown
        :PROGRESS_CLASS,     0x00000020, # progress
        :HOTKEY_CLASS,       0x00000040, # hotkey
        :ANIMATE_CLASS,      0x00000080, # animate
        :WIN95_CLASSES,      0x000000FF,
        :DATE_CLASSES,       0x00000100, # month picker, date picker
        :USEREX_CLASSES,     0x00000200, # comboex
        :COOL_CLASSES,       0x00000400, # rebar (coolbar) control
        :INTERNET_CLASSES,   0x00000800,
        :PAGESCROLLER_CLASS, 0x00001000, # page scroller
        :NATIVEFNTCTL_CLASS, 0x00002000, # native font control
    ]
    buffer += [:STANDARD_CLASSES, 0x00004000, :LINK_CLASS, 0x00008000] if WindowsVersion >= :xp

    InitCommonControls = enum :init_common_controls, buffer
  end
end