module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/bb775804(v=vs.85).aspx
    # MEASUREITEMSTRUCT for ownerdraw
    class MEASUREITEMSTRUCT < FFIStruct
      layout :CtlType,    :uint,
             :CtlID,      :uint,
             :itemID,     :uint,
             :itemWidth,  :uint,
             :itemHeight, :uint,
             :itemData,   :ulong
    end
  end
end