require 'win-ffi/user32/enum/window/message/edit_message'

module WinFFI
  module User32
    class << self
      def Edit_CanUndo(hwndCtl)
        SendMessage(hwndCtl, EditMessage[:CANUNDO], 0, 0)
      end

      def Edit_EmptyUndoBuffer(hwndCtl)
        SendMessage(hwndCtl, EditMessage[:EMPTYUNDOBUFFER], 0, 0)
      end

      def Edit_Enable(hwndCtl, fEnable)
        EnableWindow(hwndCtl, fEnable)
      end

      def Edit_FmtLines(hwndCtl, fAddEOL)
        SendMessage(hwndCtl, EditMessage[:FMTLINES], fAddEOL, 0)
      end

      def Edit_GetFirstVisibleLine(hwndCtl)
        SendMessage(hwndCtl, EditMessage[:GETFIRSTVISIBLELINE], 0, 0)
      end

      def Edit_GetHandle(hwndCtl)
        SendMessage(hwndCtl, EditMessage[:GETHANDLE], 0, 0)
      end

      def Edit_GetLine(hwndCtl, line, lpch, cchMax)
        # ((*((int*)(lpch)) = (cchMax)),
        SendMessage(hwndCtl, EditMessage[:GETLINE], line,  lpch)
      end

      def Edit_GetLineCount(hwndCtl)
        SendMessage(hwndCtl, EditMessage[:GETLINECOUNT], 0, 0)
      end

      def Edit_GetModify(hwndCtl)
        SendMessage(hwndCtl, EditMessage[:GETMODIFY], 0, 0)
      end

      def Edit_GetPasswordChar(hwndCtl)
        SendMessage(hwndCtl, EditMessage[:GETPASSWORDCHAR], 0, 0)
      end

      def Edit_GetRect(hwndCtl,lprc)
        SendMessage(hwndCtl, EditMessage[:GETRECT], 0, lprc)
      end

      def Edit_GetSel(hwndCtl)
        SendMessage(hwndCtl, EditMessage[:GETSEL], 0, 0)
      end

      def Edit_GetText(hwndCtl, lpch, cchMax)
        GetWindowText(hwndCtl, lpch, cchMax)
      end

      def Edit_GetTextLength(hwndCtl)
        GetWindowTextLength(hwndCtl)
      end

      def Edit_GetWordBreakProc(hwndCtl)
        SendMessage(hwndCtl, EditMessage[:GETWORDBREAKPROC], 0, 0)
      end

      def Edit_LimitText(hwndCtl, cchMax)
        SendMessage(hwndCtl, EditMessage[:LIMITTEXT], cchMax, 0)
      end

      def Edit_LineFromChar(hwndCtl, ich)
        SendMessage(hwndCtl, EditMessage[:LINEFROMCHAR], ich, 0)
      end

      def Edit_LineIndex(hwndCtl, line)
        SendMessage(hwndCtl, EditMessage[:LINEINDEX], line, 0)
      end

      def Edit_LineLength(hwndCtl, line)
        SendMessage(hwndCtl, EditMessage[:LINELENGTH], line, 0)
      end

      def Edit_ReplaceSel(hwndCtl, lpszReplace)
        SendMessage(hwndCtl, EditMessage[:REPLACESEL], 0, lpszReplace)
      end

      def Edit_Scroll(hwndCtl, dv, dh)
        SendMessage(hwndCtl, EditMessage[:LINESCROLL], dh, dv)
      end

      def Edit_ScrollCaret(hwndCtl)
        SendMessage(hwndCtl, EditMessage[:SCROLLCARET], 0, 0)
      end

      def Edit_SetHandle(hwndCtl, h)
        SendMessage(hwndCtl, EditMessage[:SETHANDLE], h, 0)
      end

      def Edit_SetModify(hwndCtl, fModified)
        SendMessage(hwndCtl, EditMessage[:SETMODIFY], fModified, 0)
      end

      def Edit_SetPasswordChar(hwndCtl, ch)
        SendMessage(hwndCtl, EditMessage[:SETPASSWORDCHAR], ch, 0)
      end

      def Edit_SetReadOnly(hwndCtl, fReadOnly)
        SendMessage(hwndCtl, EditMessage[:SETREADONLY], fReadOnly, 0)
      end

      def Edit_SetRect(hwndCtl, lprc)
        SendMessage(hwndCtl, EditMessage[:SETRECT], 0, lprc)
      end

      def Edit_SetRectNoPaint(hwndCtl, lprc)
        SendMessage(hwndCtl, EditMessage[:SETRECTNP], 0, lprc)
      end

      def Edit_SetSel(hwndCtl, ichStart, ichEnd)
        SendMessage(hwndCtl, EditMessage[:SETSEL], ichStart, ichEnd)
      end

      def Edit_SetTabStops(hwndCtl, cTabs, lpTabs)
        SendMessage(hwndCtl, EditMessage[:SETTABSTOPS], cTabs, lpTabs)
      end

      def Edit_SetText(hwndCtl, lpsz)
        SetWindowText(hwndCtl, lpsz)
      end

      def Edit_SetWordBreakProc(hwndCtl, lpfnWordBreak)
        SendMessage(hwndCtl, EditMessage[:SETWORDBREAKPROC], 0, lpfnWordBreak)
      end

      def Edit_Undo(hwndCtl)
        SendMessage(hwndCtl, EditMessage[:UNDO], 0, 0)
      end
    end
  end
end