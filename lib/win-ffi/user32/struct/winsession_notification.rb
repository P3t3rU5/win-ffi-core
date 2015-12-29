module WinFFI
  module User32
    if WindowsVersion >= :xp
      # WTSSESSION_NOTIFICATION struct pointed by lParam, for WM_WTSSESSION_CHANGE
      class WTSSESSION_NOTIFICATION < FFIStruct
        layout :cbSize,      :dword,
               :dwSessionId, :dword

        def initialize
          self.cbSize = self.size
        end
      end
    end
  end
end