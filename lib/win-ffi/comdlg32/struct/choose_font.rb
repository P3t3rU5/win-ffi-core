module WinFFI
  module Comdlg32
    # UINT_PTR CALLBACK CFHookProc(
    #   _In_  HWND hdlg,
    #   _In_  UINT uiMsg,
    #   _In_  WPARAM wParam,
    #   _In_  LPARAM lParam )
    CFHookProc = callback 'CFHookProc', [:hwnd, :uint, :wparam, :lparam], :uint

    class CHOOSEFONT < FFIStruct
      layout :lStructSize,    :dword,
             :hwndOwner,      :hwnd,
             :hDC,            :hdc,
             :lpLogFont,      :pointer,
             :iPointSize,     :int,
             :Flags,          :dword,
             :rgbColors,      :colorref,
             :lCustData,      :lparam,
             :lpfnHook,       CFHookProc,
             :lpTemplateName, :string,
             :hInstance,      :hinstance,
             :lpszStyle,      :pointer,
             :nFontType,      :word,
             :nSizeMin,       :int,
             :nSizeMax,       :int
    end
  end
end