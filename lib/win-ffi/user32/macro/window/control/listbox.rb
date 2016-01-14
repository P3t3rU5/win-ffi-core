require 'win-ffi/user32/enum/window/message/listbox_message'

module WinFFI
  module User32
    class << self
      def ListBox_AddItemData(hwndCtl, data)
        User32.SendMessage(hwndCtl,ListBoxMessage[:ADDSTRING], 0, data)
      end

      def ListBox_AddString(hwndCtl, lpsz)
        User32.SendMessage(hwndCtl,ListBoxMessage[:ADDSTRING], 0, lpsz)
      end

      def ListBox_DeleteString(hwndCtl, index)
        User32.SendMessage(hwndCtl,ListBoxMessage[:DELETESTRING], index, 0)
      end

      def ListBox_Dir(hwndCtl, attrs, lpszFileSpec)
        User32.SendMessage(hwndCtl,ListBoxMessage[:DIR], attrs, lpszFileSpec)
      end

      def ListBox_Enable(hwndCtl, fEnable)
        EnableWindow(hwndCtl, fEnable)
      end

      def ListBox_FindItemData(hwndCtl, indexStart, data)
        User32.SendMessage(hwndCtl,ListBoxMessage[:FINDSTRING], indexStart, data)
      end

      def ListBox_FindString(hwndCtl, indexStart, lpszFind)
        User32.SendMessage(hwndCtl,ListBoxMessage[:FINDSTRING], indexStart, lpszFind)
      end

      def ListBox_FindStringExact(hwndCtl, indexStart, lpszFind)
        User32.SendMessage(hwndCtl,ListBoxMessage[:FINDSTRINGEXACT], indexStart, lpszFind)
      end

      def ListBox_GetCaretIndex(hwndCtl)
        User32.SendMessage(hwndCtl,ListBoxMessage[:GETCARETINDEX], 0, 0)
      end

      def ListBox_GetCount(hwndCtl)
        User32.SendMessage(hwndCtl,ListBoxMessage[:GETCOUNT], 0, 0)
      end

      def ListBox_GetCurSel(hwndCtl)
        User32.SendMessage(hwndCtl,ListBoxMessage[:GETCURSEL], 0, 0)
      end

      def ListBox_GetHorizontalExtent(hwndCtl)
        User32.SendMessage(hwndCtl,ListBoxMessage[:GETHORIZONTALEXTENT], 0, 0)
      end

      def ListBox_GetItemData(hwndCtl, index)
        User32.SendMessage(hwndCtl,ListBoxMessage[:GETITEMDATA], index, 0)
      end

      def ListBox_GetItemHeight(hwndCtl, index)
        User32.SendMessage(hwndCtl,ListBoxMessage[:GETITEMHEIGHT], index, 0)
      end

      def ListBox_GetItemRect(hwndCtl, index, lprc)
        User32.SendMessage(hwndCtl,ListBoxMessage[:GETITEMRECT], index, lprc)
      end

      def ListBox_GetSel(hwndCtl, index)
        User32.SendMessage(hwndCtl,ListBoxMessage[:GETSEL], index, 0)
      end

      def ListBox_GetSelCount(hwndCtl)
        User32.SendMessage(hwndCtl,ListBoxMessage[:GETSELCOUNT], 0, 0)
      end

      def ListBox_GetSelItems(hwndCtl, cItems, lpItems)
        User32.SendMessage(hwndCtl,ListBoxMessage[:GETSELITEMS], cItems, lpItems)
      end

      def ListBox_GetText(hwndCtl, index, lpszBuffer)
        User32.SendMessage(hwndCtl,ListBoxMessage[:GETTEXT], index, lpszBuffer)
      end

      def ListBox_GetTextLen(hwndCtl, index)
        User32.SendMessage(hwndCtl,ListBoxMessage[:GETTEXTLEN], index, 0)
      end

      def ListBox_GetTopIndex(hwndCtl)
        User32.SendMessage(hwndCtl,ListBoxMessage[:GETTOPINDEX], 0, 0)
      end

      def ListBox_InsertItemData(hwndCtl, index, data)
        User32.SendMessage(hwndCtl,ListBoxMessage[:INSERTSTRING], index, data)
      end

      def ListBox_InsertString(hwndCtl, index, lpsz)
        User32.SendMessage(hwndCtl,ListBoxMessage[:INSERTSTRING], index, lpsz)
      end

      def ListBox_ResetContent(hwndCtl)
        User32.SendMessage(hwndCtl,ListBoxMessage[:RESETCONTENT], 0, 0)
      end

      def ListBox_SelItemRange(hwndCtl, fSelect, first, last)
        User32.SendMessage(hwndCtl,ListBoxMessage[:SELITEMRANGE], fSelect, MAKELPARAM(first, last))
      end

      def ListBox_SelectItemData(hwndCtl, indexStart, data)
        User32.SendMessage(hwndCtl,ListBoxMessage[:SELECTSTRING], indexStart, data)
      end

      def ListBox_SelectString(hwndCtl, indexStart, lpszFind)
        User32.SendMessage(hwndCtl,ListBoxMessage[:SELECTSTRING], indexStart, lpszFind)
      end

      def ListBox_SetCaretIndex(hwndCtl, index)
        User32.SendMessage(hwndCtl,ListBoxMessage[:SETCARETINDEX], index, 0)
      end

      def ListBox_SetColumnWidth(hwndCtl, cxColumn)
        User32.SendMessage(hwndCtl,ListBoxMessage[:SETCOLUMNWIDTH], cxColumn, 0)
      end

      def ListBox_SetCurSel(hwndCtl, index)
        User32.SendMessage(hwndCtl,ListBoxMessage[:SETCURSEL], index, 0)
      end

      def ListBox_SetHorizontalExtent(hwndCtl, cxExtent)
        User32.SendMessage(hwndCtl,ListBoxMessage[:SETHORIZONTALEXTENT], cxExtent, 0)
      end

      def ListBox_SetItemData(hwndCtl, index, data)
        User32.SendMessage(hwndCtl,ListBoxMessage[:SETITEMDATA], index, data)
      end

      def ListBox_SetItemHeight(hwndCtl, index, cy)
        User32.SendMessage(hwndCtl,ListBoxMessage[:SETITEMHEIGHT], index, MAKELPARAM(cy, 0))
      end

      def ListBox_SetSel(hwndCtl, fSelect, index)
        User32.SendMessage(hwndCtl,ListBoxMessage[:SETSEL], fSelect, index)
      end

      def ListBox_SetTabStops(hwndCtl, cTabs, lpTabs)
        User32.SendMessage(hwndCtl,ListBoxMessage[:SETTABSTOPS], cTabs, lpTabs)
      end

      def ListBox_SetTopIndex(hwndCtl, indexTop)
        User32.SendMessage(hwndCtl,ListBoxMessage[:SETTOPINDEX], indexTop, 0)
      end
    end
  end
end

