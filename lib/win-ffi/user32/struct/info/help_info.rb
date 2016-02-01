module WinFFI
  module User32
    if WindowsVersion >= :xp

      require 'win-ffi/user32/enum/help_info_context'

      require 'win-ffi/general/struct/point'

      # https://msdn.microsoft.com/en-us/library/windows/desktop/bb773313(v=vs.85).aspx
      # Structure pointed to by lParam of WM_HELP
      class HELPINFO < FFIStruct
        layout :cbSize,       :uint,   # Size in bytes of this struct,
               :iContextType, HelpInfoContext, # Either HELPINFO_WINDOW or HELPINFO_MENUITEM,
               :iCtrlId,      :int,    # Control Id or a Menu item Id.,
               :hItemHandle,  :handle, # hWnd of control or hMenu.,
               :dwContextId,  :dword,  # Context Id associated with this item,
               :MousePos,     POINT   # Mouse Position in screen co-ordinates

        def initialize
          super
          self.cbSize = self.size
        end
      end
    end
  end
end