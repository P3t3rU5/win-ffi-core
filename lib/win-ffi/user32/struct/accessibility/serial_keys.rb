require 'win-ffi/user32/enum/accessibility/flag/serial_keys_flag'

module WinFFI
  module User32

    class SERIALKEYSA < FFIStruct
      layout :cbSize,         :uint,
             :dwFlags,        SerialKeysFlag,
             :lpszActivePort, :string,
             :lpszPort,       :string,
             :iBaudRate,      :uint,
             :iPortState,     :uint,
             :iActive,        :uint

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end