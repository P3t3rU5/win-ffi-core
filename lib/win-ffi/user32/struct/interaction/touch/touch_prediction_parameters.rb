module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/hh969214(v=vs.85).aspx
    class TOUCHPREDICTIONPARAMETERS < FFIStruct
      layout :cbSize,          :uint,
             :dwLatency,       :uint, # Latency in millisecs,
             :dwSampleTime,    :uint, # Sample time in millisecs (used to deduce velocity),
             :bUseHWTimeStamp, :uint, # Use H/W TimeStamps

          def initialize
            super
            self.cbSize = self.size
          end
    end
  end
end