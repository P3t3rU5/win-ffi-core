module WinFFI
  module Comdlg32
    module Color

      extend LibBase

      ffi_lib 'Comdlg32'

      #UINT_PTR CALLBACK CCHookProc(
      #  _In_  HWND hdlg,
      #  _In_  UINT uiMsg,
      #  _In_  WPARAM wParam,
      #  _In_  LPARAM lParam )
      CCHookProc = callback :CCHookProc, [:hwnd, :uint, :wparam, :lparam], :uint

      class CHOOSECOLOR < FFI::Struct
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

      #BOOL WINAPI ChooseColor( _Inout_  LPCHOOSECOLOR lpcc )
      attach_function 'ChooseColorA', [CHOOSECOLOR.ptr], :bool
      attach_function 'ChooseColorW', [CHOOSECOLOR.ptr], :bool

    end
  end
end