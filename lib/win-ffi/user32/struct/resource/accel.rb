require 'win-ffi/user32/enum/resource/accelerator_flag'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646340(v=vs.85).aspx
    class ACCEL < FFIStruct
      layout :fvirt, AcceleratorFlag,
             :key,   :word,
             :cmd,   :word
    end
  end
end