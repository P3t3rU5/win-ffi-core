require 'win-ffi/user32'

require 'win-ffi/user32/enum/window/message/edit_message'

module WinFFI
  module User32
    class << self
      def Static_Enable(hwndCtl, fEnable)
        EnableWindow(hwndCtl, fEnable)
      end

      def Static_GetIcon(hwndCtl, hIcon)
        SendMessage(hwndCtl, StaticMessage[:GETICON], 0, 0)
      end

      def Static_GetText(hwndCtl, lpch, cchMax)
        GetWindowText(hwndCtl, lpch, cchMax)
      end

      def Static_GetTextLength(hwndCtl)
        GetWindowTextLength(hwndCtl)
      end
      def Static_SetIcon(hwndCtl, hIcon)
        SendMessage(hwndCtl,StaticMessage[:SETICON], hIcon, 0)
      end

      def Static_SetText(hwndCtl, lpsz)
        SetWindowText(hwndCtl, lpsz)
      end
    end
  end
end