module WinFFI
  module User32
    if WindowsVersion >= :vista
      require 'win-ffi/user32/enum/window/control/owner_drawn_control_type'

      # DELETEITEMSTRUCT for ownerdraw
      # https://msdn.microsoft.com/en-us/library/windows/desktop/bb775151(v=vs.85).aspx
      class DELETEITEMSTRUCT < FFIStruct
        layout :CtlType,  OwnerDrawnControlType,
               :CtlID,    :uint,
               :itemID,   :uint,
               :hwndItem, :hwnd,
               :itemData, :ulong
      end
    end
  end
end