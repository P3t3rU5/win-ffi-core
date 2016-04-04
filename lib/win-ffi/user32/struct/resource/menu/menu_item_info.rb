require 'win-ffi/user32/enum/resource/menu/menu_item_info_member'
require 'win-ffi/user32/enum/resource/menu/menu_flag_type'
require 'win-ffi/user32/enum/resource/menu/menu_flag_state'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647578(v=vs.85).aspx
    class MENUITEMINFO < FFIStruct
      layout :cbSize,        :uint,
             :fMask,         MenuItemInfoMember,
             :ftype,         MenuFlagType,  # used if MIIM_TYPE (4.0) or MIIM_FTYPE (>4.0)
             :fState,        MenuFlagState, # used if MIIM_STATE
             :wID,           :uint,          # used if MIIM_ID
             :hSubMenu,      :hmenu,         # used if MIIM_SUBMENU
             :hbmpChecked,   :pointer,       # used if MIIM_CHECKMARKS
             :hbmpUnchecked, :pointer,       # used if MIIM_CHECKMARKS
             :dwItemData,    :ulong,         # used if MIIM_DATA
             :dwTypeData,    :string,        # used if MIIM_TYPE (4.0) or MIIM_STRING (>4.0)
             :cch,           :uint,          # used if MIIM_TYPE (4.0) or MIIM_STRING (>4.0)
             :hbmpItem,      :pointer        # used if MIIM_BITMAP

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end