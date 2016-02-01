module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648737(v=vs.85).aspx
    class MONLINKSTRUCT < FFIStruct
      layout :cb,           :uint,
             :dwTime,       :dword,
             :hTask,        :handle,
             :fEstablished, :bool,
             :fNoData,      :bool,
             :hszSvc,       :hsz,
             :hszTopic,     :hsz,
             :hszItem,      :hsz,
             :wFmt,         :uint,
             :fServer,      :bool,
             :hConvServer,  :hconv,
             :hConvClient,  :hconv
    end
  end
end
