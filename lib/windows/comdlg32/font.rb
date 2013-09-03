module WinFFI
  module Comdlg32
    module Font

      extend LibBase

      ffi_lib 'Comdlg32'

      CF_SCREENFONTS          = 0x00000001
      CF_PRINTERFONTS         = 0x00000002
      CF_BOTH                 = 0x00000003
      CF_SHOWHELP             = 0x00000004
      CF_ENABLEHOOK           = 0x00000008
      CF_ENABLETEMPLATE       = 0x00000010
      CF_ENABLETEMPLATEHANDLE = 0x00000020
      CF_INITTOLOGFONTSTRUCT  = 0x00000040
      CF_USESTYLE             = 0x00000080
      CF_EFFECTS              = 0x00000100
      CF_APPLY                = 0x00000200
      CF_ANSIONLY             = 0x00000400
      CF_SCRIPTSONLY          = CF_ANSIONLY
      CF_NOVECTORFONTS        = 0x00000800
      CF_NOOEMFONTS           = CF_NOVECTORFONTS
      CF_NOSIMULATIONS        = 0x00001000
      CF_LIMITSIZE            = 0x00002000
      CF_FIXEDPITCHONLY       = 0x00004000
      CF_WYSIWYG              = 0x00008000
      CF_FORCEFONTEXIST       = 0x00010000
      CF_SCALABLEONLY         = 0x00020000
      CF_TTONLY               = 0x00040000
      CF_NOFACESEL            = 0x00080000
      CF_NOSTYLESEL           = 0x00100000
      CF_NOSIZESEL            = 0x00200000
      CF_SELECTSCRIPT         = 0x00400000
      CF_NOSCRIPTSEL          = 0x00800000
      CF_NOVERTFONTS          = 0x01000000
      CF_INACTIVEFONTS        = 0x02000000

      #UINT_PTR CALLBACK CFHookProc(
      #  _In_  HWND hdlg,
      #  _In_  UINT uiMsg,
      #  _In_  WPARAM wParam,
      #  _In_  LPARAM lParam )
      CFHookProc = callback 'CFHookProc', [:hwnd, :uint, :wparam, :lparam], :uint

      class CHOOSEFONT < FFI::Struct
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

      #BOOL WINAPI ChooseFont( _Inout_  LPCHOOSEFONT lpcf )
      attach_function 'ChooseFontA', [CHOOSEFONT.ptr], :bool
      attach_function 'ChooseFontW', [CHOOSEFONT.ptr], :bool
    end
  end
end