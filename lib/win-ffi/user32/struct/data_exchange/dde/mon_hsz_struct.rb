module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648736(v=vs.85).aspx
    class MONHSZSTRUCT < FFIStruct
      layout :cb, :uint,
             :fsAction, :bool, # MH_ value */,
             :dwTime,   :dword,
             :hsz,      :hsz,
             :hTask,    :handle,
             :str,      [:char, 1]
    end
  end
end