module WinFFI
  module User32
    if WindowsVersion >= 7
      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd353233(v=vs.85).aspx
      class GESTURENOTIFYSTRUCT < FFIStruct
        layout :cbSize,       :uint,   # size, in bytes, of this structure,
               :dwFlags,      :dword,  # unused,
               :hwndTarget,   :hwnd,   # handle to window targeted by the gesture,
               :ptsLocation,  :points, # starting location,
               :dwInstanceID, :dword,  # internally used

            def initialize
              super
              self.cbSize = self.size
            end
      end
    end
  end
end