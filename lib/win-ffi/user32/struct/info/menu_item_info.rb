require 'win-ffi/user32/enum/window/control/menu_item_info_flags'
require 'win-ffi/user32/enum/window/control/menu_flags_type'
require 'win-ffi/user32/enum/window/state/menu_flags_state'

module WinFFI
  module User32
    class MENUITEMINFO < FFIStruct
      layout :cbSize,        :uint,
             :fMask,         MenuFlagsType,
             :ftype,         MenuFlagsType,
             :fState,        MenuFlagsState,
             :wID,           :uint,
             :hSubMenu,      :hmenu,
             :hbmpChecked,   :pointer,
             :hbmpUnchecked, :pointer,
             :dwItemData,    :ulong,
             :dwTypeData,    :string,
             :cch,           :uint,
             :hbmpItem,      :pointer

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end