require 'win-ffi/user32'

module WinFFI
  module User32
    HelpInfoContext = enum :help_info_context, [
        :WINDOW,   0x0001,
        :MENUITEM, 0x0002
    ]
  end
end