require 'win-ffi/user32/enum/window/control/menu/menu_info_member'
require 'win-ffi/user32/enum/window/style/menu_style'

module WinFFI
  module User32
    class MENUINFO < FFIStruct
      layout :cbSize,          :dword,
             :fMask,           MenuInfoMember,
             :dwStyle,         MenuStyle,
             :cyMax,           :uint,
             :hbrBack,         :hbrush,
             :dwContextHelpID, :dword,
             :dwMenuData,      :ulong

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end