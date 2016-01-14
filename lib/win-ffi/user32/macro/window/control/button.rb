require 'win-ffi/user32/enum/window/message/button_message'

module WinFFI
  module User32
    class << self
      def Button_Enable(hwndCtl, fEnable)
        EnableWindow(hwndCtl, fEnable)
      end

      def Button_GetCheck(hwndCtl)
        SendMessage(hwndCtl, ButtonMessage[:GETCHECK], 0, 0)
      end

      def Button_GetState(hwndCtl)
        SendMessage(hwndCtl, ButtonMessage[:GETSTATE], 0, 0)
      end

      def Button_GetText(hwndCtl, lpch, cchMax)
        GetWindowText(hwndCtl, lpch, cchMax)
      end

      def Button_GetTextLength(hwndCtl)
        GetWindowTextLength(hwndCtl)
      end

      def Button_SetCheck(hwndCtl, check)
        SendMessage(hwndCtl, ButtonMessage[:SETCHECK], check, 0)
      end

      def Button_SetState(hwndCtl, state)
        SendMessage(hwndCtl, ButtonMessage[:SETSTATE], state, 0)
      end

      def Button_SetStyle(hwndCtl, style,fRedraw)
        SendMessage(hwndCtl, ButtonMessage[:SETSTYLE], style, MAKELPARAM(fRedraw ? true : false), 0)
      end

      def Button_SetText(hwndCtl, lpsz)
        SetWindowText(hwndCtl, lpsz)
      end
    end
  end
end