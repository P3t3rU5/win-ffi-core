module WinFFI
  module Comdlg32

    #UINT_PTR CALLBACK CCHookProc(
    #  _In_  HWND hdlg,
    #  _In_  UINT uiMsg,
    #  _In_  WPARAM wParam,
    #  _In_  LPARAM lParam )
    CCHookProc = callback :CCHookProc, [:hwnd, :uint, :wparam, :lparam], :uint

    class CHOOSECOLOR < FFIStruct
      layout :lStructSize,    :ulong,
             :hwndOwner,      :hwnd,
             :hInstance,      :hinstance,
             :rgbResult,      :ulong,
             :lpCustColors,   :pointer,
             :Flags,          :ulong,
             :lCustData,      :long,
             :lpfnHook,       CCHookProc,
             :lpTemplateName, :pointer
    end
  end
end