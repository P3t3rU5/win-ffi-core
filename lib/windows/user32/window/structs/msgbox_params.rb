module WinFFI
  module User32
    module Dialog
      class MSGBOXPARAMS < FFI::Struct
        layout :cbSize,             :uint,
               :hwndOwner,          :hwnd,
               :hInstance,          :hinstance,
               :lpszText,           :string,
               :lpszCaption,        :string,
               :dwStyle,            :dword,
               :lpszIcon,           :string,
               :dwContextHelpId,    :ulong,
               :lpfnMsgBoxCallback, :pointer,
               :dwLanguageId,       :dword
      end
    end
  end
end