module WinFFI
  module User32
    class MSGBOXPARAMS < FFIStruct
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