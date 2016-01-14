module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd388197(v=vs.85).aspx
    class CHANGEFILTERSTRUCT < FFIStruct
      layout :cbSize,    :dword,
             :ExtStatus, MessageFilterInfo

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end