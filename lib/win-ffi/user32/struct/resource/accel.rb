module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646340(v=vs.85).aspx
    class ACCEL < FFIStruct
      layout :fvirt, AcceleratorFlags,
             :key,   :word,
             :cmd,   :word
    end
  end
end