module WinFFI
  module User32
    # Structure pointed to by lParam of WM_HELP
    class HELPINFO < FFIStruct
      layout :cbSize,       :uint,   # Size in bytes of this struct,
             :iContextType, HelpInfoContext, # Either HELPINFO_WINDOW or HELPINFO_MENUITEM,
             :iCtrlId,      :int,    # Control Id or a Menu item Id.,
             :hItemHandle,  :handle, # hWnd of control or hMenu.,
             :dwContextId,  :dword,  # Context Id associated with this item,
             :MousePos,     :point   # Mouse Position in screen co-ordinates

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end