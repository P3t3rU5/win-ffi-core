module WinFFI
  module User32
    # the following structure is for use with XTYP_WILDCONNECT processing.
    class HSZPAIR < FFIStruct
      layout :hszSvc,   :hsz,
             :hszTopic, :hsz
    end
  end
end