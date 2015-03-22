module WinFFI
  module User32
    class MENUITEMINFO < FFIStruct
      layout :cbSize,        :uint,
             :fMask,         :uint,
             :ftype,         :uint,
             :fState,        :uint,
             :wID,           :uint,
             :hSubMenu,      :hmenu,
             :hbmpChecked,   :pointer,
             :hbmpUnchecked, :pointer,
             :dwItemData,    :ulong,
             :dwTypeData,    :string,
             :cch,           :uint,
             :hbmpItem,      :pointer
    end
  end
end