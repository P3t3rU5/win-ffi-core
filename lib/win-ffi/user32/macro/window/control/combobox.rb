require 'win-ffi/user32/enum/window/message/combobox_message'

module WinFFI
  module User32
    class << self
      def ComboBox_AddItemData(hwndCtl, data)
        SendMessage(hwndCtl, ComboBoxMessage[:ADDSTRING], 0, data)
      end

      def ComboBox_AddString(hwndCtl, lpsz)
        SendMessage(hwndCtl, ComboBoxMessage[:ADDSTRING], 0, lpsz)
      end

      def ComboBox_DeleteString(hwndCtl, index)
        SendMessage(hwndCtl, ComboBoxMessage[:DELETESTRING], index, 0)
      end

      def ComboBox_Dir(hwndCtl, attrs, lpszFileSpec)
        SendMessage(hwndCtl, ComboBoxMessage[:DIR], attrs, lpszFileSpec)
      end

      def ComboBox_Enable(hwndCtl, fEnable)
        EnableWindow(hwndCtl, fEnable)
      end

      def ComboBox_FindItemData(hwndCtl, indexStart, data)
        SendMessage(hwndCtl, ComboBoxMessage[:FINDSTRING], indexStart, data)
      end

      def ComboBox_FindString(hwndCtl, indexStart, lpszFind)
        SendMessage(hwndCtl, ComboBoxMessage[:FINDSTRING], indexStart, lpszFind)
      end

      def ComboBox_FindStringExact(hwndCtl, indexStart, lpszFind)
        SendMessage(hwndCtl, ComboBoxMessage[:FINDSTRINGEXACT], indexStart, lpszFind)
      end

      def ComboBox_GetCount(hwndCtl)
        SendMessage(hwndCtl, ComboBoxMessage[:GETCOUNT], 0, 0)
      end

      def ComboBox_GetCurSel(hwndCtl)
        SendMessage(hwndCtl, ComboBoxMessage[:GETCURSEL], 0, 0)
      end

      def ComboBox_GetDroppedControlRect(hwndCtl, lprc)
        SendMessage(hwndCtl, ComboBoxMessage[:GETDROPPEDCONTROLRECT], 0, lprc)
      end

      def ComboBox_GetDroppedState(hwndCtl)
        SendMessage(hwndCtl, ComboBoxMessage[:GETDROPPEDSTATE], 0, 0)
      end

      def ComboBox_GetEditSel(hwndCtl)
        SendMessage(hwndCtl, ComboBoxMessage[:GETEDITSEL], 0, 0)
      end

      def ComboBox_GetExtendedUI(hwndCtl)
        SendMessage(hwndCtl, ComboBoxMessage[:GETEXTENDEDUI], 0, 0)
      end

      def ComboBox_GetItemData(hwndCtl, index)
        SendMessage(hwndCtl, ComboBoxMessage[:GETITEMDATA], index, 0)
      end

      def ComboBox_GetItemHeight(hwndCtl)
        SendMessage(hwndCtl, ComboBoxMessage[:GETITEMHEIGHT], 0, 0)
      end

      def ComboBox_GetLBText(hwndCtl, index, lpszBuffer)
        SendMessage(hwndCtl, ComboBoxMessage[:GETLBTEXT], index, lpszBuffer)
      end

      def ComboBox_GetLBTextLen(hwndCtl, index)
        SendMessage(hwndCtl, ComboBoxMessage[:GETLBTEXTLEN], index, 0)
      end

      def ComboBox_GetText(hwndCtl, lpch, cchMax)
        GetWindowText(hwndCtl, lpch, cchMax)
      end

      def ComboBox_GetTextLength(hwndCtl)
        GetWindowTextLength(hwndCtl)
      end

      def ComboBox_InsertItemData(hwndCtl, index, data)
        SendMessage(hwndCtl, ComboBoxMessage[:INSERTSTRING], index, data)
      end

      def ComboBox_InsertString(hwndCtl, index, lpsz)
        SendMessage(hwndCtl, ComboBoxMessage[:INSERTSTRING], index, lpsz)
      end

      def ComboBox_LimitText(hwndCtl, cchLimit)
        SendMessage(hwndCtl, ComboBoxMessage[:LIMITTEXT], cchLimit, 0)
      end

      def ComboBox_ResetContent(hwndCtl)
        SendMessage(hwndCtl, ComboBoxMessage[:RESETCONTENT], 0, 0)
      end

      def ComboBox_SelectItemData(hwndCtl, indexStart, data)
        SendMessage(hwndCtl, ComboBoxMessage[:SELECTSTRING], indexStart, data)
      end

      def ComboBox_SelectString(hwndCtl, indexStart, lpszSelect)
        SendMessage(hwndCtl, ComboBoxMessage[:SELECTSTRING], indexStart, lpszSelect)
      end

      def ComboBox_SetCurSel(hwndCtl, index)
        SendMessage(hwndCtl, ComboBoxMessage[:SETCURSEL], index, 0)
      end

      def ComboBox_SetEditSel(hwndCtl, ichStart, ichEnd)
        SendMessage(hwndCtl, ComboBoxMessage[:SETEDITSEL], 0, MAKELPARAM(ichStart, ichEnd))
      end

      def ComboBox_SetExtendedUI(hwndCtl, flags)
        SendMessage(hwndCtl, ComboBoxMessage[:SETEXTENDEDUI], flags, 0)
      end

      def ComboBox_SetItemData(hwndCtl, index, data)
        SendMessage(hwndCtl, ComboBoxMessage[:SETITEMDATA], index, data)
      end

      def ComboBox_SetItemHeight(hwndCtl, index, cyItem)
        SendMessage(hwndCtl, ComboBoxMessage[:SETITEMHEIGHT], index, cyItem)
      end

      def ComboBox_SetText(hwndCtl, lpsz)
        SetWindowText(hwndCtl, lpsz)
      end

      def ComboBox_ShowDropdown(hwndCtl, fShow)
        SendMessage(hwndCtl, ComboBoxMessage[:SHOWDROPDOWN], fShow, 0)
      end
    end
  end
end