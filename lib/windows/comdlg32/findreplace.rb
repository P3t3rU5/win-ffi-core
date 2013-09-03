module WinFFI
  module Comdlg32
    module FindReplace

      extend LibBase

      ffi_lib 'Comdlg32'

      FRERR_FINDREPLACECODES = 0x4000
      FRERR_BUFFERLENGTHZERO = 0x4001

      FR_DOWN                 = 0x00000001
      FR_WHOLEWORD            = 0x00000002
      FR_MATCHCASE            = 0x00000004
      FR_FINDNEXT             = 0x00000008
      FR_REPLACE              = 0x00000010
      FR_REPLACEALL           = 0x00000020
      FR_DIALOGTERM           = 0x00000040
      FR_SHOWHELP             = 0x00000080
      FR_ENABLEHOOK           = 0x00000100
      FR_ENABLETEMPLATE       = 0x00000200
      FR_NOUPDOWN             = 0x00000400
      FR_NOMATCHCASE          = 0x00000800
      FR_NOWHOLEWORD          = 0x00001000
      FR_ENABLETEMPLATEHANDLE = 0x00002000
      FR_HIDEUPDOWN           = 0x00004000
      FR_HIDEMATCHCASE        = 0x00008000
      FR_HIDEWHOLEWORD        = 0x00010000
      FR_RAW                  = 0x00020000
      FR_MATCHDIAC            = 0x20000000
      FR_MATCHKASHIDA         = 0x40000000
      FR_MATCHALEFHAMZA       = 0x80000000

      #UINT_PTR CALLBACK FRHookProc(
      #  _In_  HWND hdlg,
      #  _In_  UINT uiMsg,
      #  _In_  WPARAM wParam,
      #  _In_  LPARAM lParam )
      callback :FRHOOKPROC, [:hwnd, :uint, :wparam, :lparam], :uint

      class FINDREPLACE < FFI::Struct
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

      #HWND WINAPI FindText( _In_  LPFINDREPLACE lpfr )
      attach_function 'FindText', :FindTextA, [:pointer], :pointer

      #HWND WINAPI ReplaceText( _Inout_  LPFINDREPLACE lpfr )
      attach_function 'ReplaceText', :ReplaceTextA, [:pointer], :pointer
    end
  end
end
