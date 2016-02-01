module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648734(v=vs.85).aspx
    class MONCONVSTRUCT < FFIStruct
      layout :cb,          :uint,
             :fConnect,    :bool,
             :dwTime,      :dword,
             :hTask,       :handle,
             :hszSvc,      :hsz,
             :hszTopic,    :hsz,
             :hConvClient, :hconv, # Globally unique value != apps local hConv,
             :hConvServer, :hconv  # Globally unique value != apps local hConv
    end
  end
end