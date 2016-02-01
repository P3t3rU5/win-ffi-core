require 'win-ffi/user32/enum/window/flag/show_window_flags'
require 'win-ffi/user32/enum/window/control/scrollbar'

module WinFFI
  module User32
    class << self
      def ScrollBar_Enable(hwndCtl, flags)
        EnableScrollBar(hwndCtl, ScrollBar[:CTL], flags)
      end

      def ScrollBar_GetPos(hwndCtl)
        GetScrollPos(hwndCtl, ScrollBar[:CTL])
      end

      def ScrollBar_GetRange(hwndCtl, lpposMin, lpposMax)
        GetScrollRange(hwndCtl, ScrollBar[:CTL], lpposMin, lpposMax)
      end

      def ScrollBar_SetPos(hwndCtl, pos, fRedraw)
        SetScrollPos(hwndCtl, ScrollBar[:CTL], pos, fRedraw)
      end

      def ScrollBar_SetRange(hwndCtl, posMin, posMax, fRedraw)
        SetScrollRange(hwndCtl, ScrollBar[:CTL], posMin, posMax, fRedraw)
      end

      def ScrollBar_Show(hwndCtl, fShow)
        ShowWindow(hwndCtl, fShow ? ShowWindowFlags[:SHOWNORMAL] : ShowWindowFlags[:HIDE])
      end
    end
  end
end