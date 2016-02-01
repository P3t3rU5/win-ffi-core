require 'win-ffi/user32/enum/data_exchange/dde/transaction_type'
require 'win-ffi/user32/enum/data_exchange/dde/dde_status'
require 'win-ffi/user32/enum/data_exchange/dde/conversation_status'

require 'win-ffi/user32/struct/data_exchange/dde/conv_context'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648731(v=vs.85).aspx
    # The following structure is used by DdeQueryConvInfo()
    class CONVINFO < FFIStruct
      layout :cb,            :dword, # sizeof(CONVINFO)
             :hUser,         :dword, # user specified field
             :hConvPartner,  :hconv, # hConv on other end or 0 if non-ddemgr partner
             :hszSvcPartner, :hsz,   # app name of partner if obtainable
             :hszServiceReq, :hsz,   # AppName requested for connection
             :hszTopic,      :hsz,   # Topic name for conversation
             :hszItem,       :hsz,   # transaction item name or NULL if quiescent
             :wFmt,          :uint,  # transaction format or NULL if quiescent
             :wType,         TransactionType,  # XTYP_ for current transaction
             :wStatus,       ConversationStatus,  # ST_ constant for current conversation
             :wConvst,       DdeStatus,  # XST_ constant for current transaction
             :wLastError,    :uint,  # last transaction error.
             :hConvList,     :pointer, # parent hConvList if this conversation is in a list
             :ConvCtxt,      CONVCONTEXT, # conversation context
             :hwnd,          :hwnd, # window handle for this conversation
             :hwndPartner,   :hwnd  # partner window handle for this conversation
    end
  end
end