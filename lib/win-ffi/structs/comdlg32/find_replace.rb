module WinFFI
  module Comdlg32
    #UINT_PTR CALLBACK FRHookProc(
    #  _In_  HWND hdlg,
    #  _In_  UINT uiMsg,
    #  _In_  WPARAM wParam,
    #  _In_  LPARAM lParam )
    callback :FRHOOKPROC, [:hwnd, :uint, :wparam, :lparam], :uint

    class FINDREPLACE < FFIStruct
      layout :lStructSize,      :dword,
             :hwndOwner,        :hwnd,
             :hInstance,        :hinstance,
             :Flags,            :dword,
             :lpstrFindWhat,    :string,
             :lpstrReplaceWith, :string,
             :wFindWhatLen,     :word,
             :wReplaceWithLen,  :word,
             :lCustData,        :lparam,
             :lpfnHook,         :FRHOOKPROC,
             :lpTemplateName,   :string
    end
  end
end