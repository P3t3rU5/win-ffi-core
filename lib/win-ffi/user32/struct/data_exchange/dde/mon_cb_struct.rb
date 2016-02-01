require 'win-ffi/user32/struct/data_exchange/dde/conv_context'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648733(v=vs.85).aspx
    class MONCBSTRUCT < FFIStruct
      layout :cb,      :uint,
             :dwTime,  :dword,
             :hTask,   :handle,
             :dwRet,   :dword,
             :wType,   :uint,
             :wFmt,    :uint,
             :hConv,   :hconv,
             :hsz1,    :hsz,
             :hsz2,    :hsz,
             :hData,   :hddedata,
             :dwData1, :ulong,
             :dwData2, :ulong,
             :cc,      CONVCONTEXT, # new for NT for XTYP_CONNECT callbacks,
             :cbData,  :dword, # new for NT for data peeking,
             :Data,    [:dword, 8] # new for NT for data peeking
    end
  end
end