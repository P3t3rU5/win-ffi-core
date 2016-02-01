require 'win-ffi/general/struct/rect'

module WinFFI
  module User32
    class COMBOBOXINFO < FFIStruct
      layout :cbSize,      :dword,
             :rcItem,      RECT,
             :rcButton,    RECT,
             :stateButton, :dword,
             :hwndCombo,   :hwnd,
             :hwndItem,    :hwnd,
             :hwndList,    :hwnd

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end