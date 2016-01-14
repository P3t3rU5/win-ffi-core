require 'win-ffi/user32/enum/window_class/message_box_flags'

module WinFFI
  module User32
    class MSGBOXPARAMS < FFIStruct
      layout :cbSize,             :uint,
             :hwndOwner,          :hwnd,
             :hInstance,          :hinstance,
             :lpszText,           :string,
             :lpszCaption,        :string,
             :dwStyle,            MessageBoxFlags,
             :lpszIcon,           :string,
             :dwContextHelpId,    :ulong,
             :lpfnMsgBoxCallback, :pointer,
             :dwLanguageId,       :dword

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end