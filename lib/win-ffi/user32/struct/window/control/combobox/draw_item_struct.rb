module WinFFI
  module User32
    if WindowsVersion >= :vista

      require 'win-ffi/user32/enum/window/control/owner_drawn_control_type'
      require 'win-ffi/user32/enum/window/control/owner_drawn_action'
      require 'win-ffi/user32/enum/window/control/owner_drawn_state'

      # DRAWITEMSTRUCT for ownerdraw
      # https://msdn.microsoft.com/en-us/library/windows/desktop/bb775802(v=vs.85).aspx
      class DRAWITEMSTRUCT < FFIStruct
        layout :CtlType,    OwnerDrawnControlType,
               :CtlID,      :uint,
               :itemID,     :uint,
               :itemAction, OwnerDrawnAction,
               :itemState,  OwnerDrawnState,
               :hwndItem,   :hwnd,
               :hDC,        :hdc,
               :rcItem,     RECT,
               :itemData,   :ulong
      end
    end
  end
end
