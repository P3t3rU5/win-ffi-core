module WinFFI
  module User32
    # lParam of WM_COPYDATA message points to...
    class COPYDATASTRUCT < FFIStruct
      layout :dwData, :ulong,
             :cbData, :dword,
             :lpData, :pointer
    end
  end
end