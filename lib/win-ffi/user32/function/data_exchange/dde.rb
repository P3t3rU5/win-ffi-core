require 'win-ffi/user32'

module WinFFI
  module User32
    typedef :pointer, :hconv
    typedef :pointer, :hddedata
    typedef :pointer, :hsz
  end
end

require 'win-ffi/user32/enum/data_exchange/dde/transaction_type'
require 'win-ffi/user32/enum/data_exchange/dde/dde_management_library_error'
require 'win-ffi/user32/enum/data_exchange/dde/dde_name_service'

require 'win-ffi/user32/struct/data_exchange/dde/conv_context'
require 'win-ffi/user32/struct/data_exchange/dde/conv_info'

module WinFFI
  module User32

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648739(v=vs.85).aspx
    # BOOL WINAPI DdeAbandonTransaction(
    #   _In_  DWORD idInst,
    #   _In_  HCONV hConv,
    #   _In_  DWORD idTransaction )
    attach_function 'DdeAbandonTransaction', [:dword, :hconv, :dword], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648740(v=vs.85).aspx
    # LPBYTE WINAPI DdeAccessData(
    #   _In_       HDDEDATA hData,
    #   _Out_opt_  LPDWORD pcbDataSize )
    attach_function 'DdeAccessData', [:hddedata, :pointer], :pointer

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648741(v=vs.85).aspx
    # HDDEDATA WINAPI DdeAddData(
    #   _In_  HDDEDATA hData,
    #   _In_  LPBYTE pSrc,
    #   _In_  DWORD cb,
    #   _In_  DWORD cbOff )
    attach_function 'DdeAddData', [:hddedata, :pointer, :dword, :dword], :pointer

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648742(v=vs.85).aspx
    # HDDEDATA CALLBACK DdeCallback(
    #   _In_  UINT uType,
    #   _In_  UINT uFmt,
    #   _In_  HCONV hconv,
    #   _In_  HSZ hsz1,
    #   _In_  HSZ hsz2,
    #   _In_  HDDEDATA hdata,
    #   _In_  ULONG_PTR dwData1,
    #   _In_  ULONG_PTR dwData2 )
    DdeCallback = callback 'DdeCallback', [:uint, :uint, :hconv, :hsz, :hsz, :hddedata, :pointer, :pointer], :hddedata

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648743(v=vs.85).aspx
    # HDDEDATA WINAPI DdeClientTransaction(
    #   _In_opt_   LPBYTE pData,
    #   _In_       DWORD cbData,
    #   _In_       HCONV hConv,
    #   _In_opt_   HSZ hszItem,
    #   _In_       UINT wFmt,
    #   _In_       UINT wType,
    #   _In_       DWORD dwTimeout,
    #   _Out_opt_  LPDWORD pdwResult )
    attach_function 'DdeClientTransaction',
                    [:pointer, :dword, :hconv, :hsz, :uint, TransactionType, :dword, :pointer], :hddedata

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648744(v=vs.85).aspx
    # int WINAPI DdeCmpStringHandles(
    #   _In_  HSZ hsz1,
    #   _In_  HSZ hsz2 )
    attach_function 'DdeCmpStringHandles', [:hsz, :hsz], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648745(v=vs.85).aspx
    # HCONV WINAPI DdeConnect(
    #   _In_      DWORD idInst,
    #   _In_      HSZ hszService,
    #   _In_      HSZ hszTopic,
    #   _In_opt_  PCONVCONTEXT pCC )
    attach_function 'DdeConnect', [:dword, :hsz, :hsz, CONVCONTEXT], :hconv

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648746(v=vs.85).aspx
    # HCONVLIST WINAPI DdeConnectList(
    #   _In_      DWORD idInst,
    #   _In_      HSZ hszService,
    #   _In_      HSZ hszTopic,
    #   _In_      HCONVLIST hConvList,
    #   _In_opt_  PCONVCONTEXT pCC )
    attach_function 'DdeConnectList', [:dword, :hsz, :hsz, :pointer, CONVCONTEXT], :pointer

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648747(v=vs.85).aspx
    # HDDEDATA WINAPI DdeCreateDataHandle(
    #   _In_      DWORD idInst,
    #   _In_opt_  LPBYTE pSrc,
    #   _In_      DWORD cb,
    #   _In_      DWORD cbOff,
    #   _In_opt_  HSZ hszItem,
    #   _In_      UINT wFmt,
    #   _In_      UINT afCmd )
    attach_function 'DdeCreateDataHandle', [:dword, :pointer, :dword, :dword, :hsz, :uint, :uint], :hddedata

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648748(v=vs.85).aspx
    # HSZ WINAPI DdeCreateStringHandle(
    #   _In_  DWORD idInst,
    #   _In_  LPTSTR psz,
    #   _In_  int iCodePage )
    encoded_function 'DdeCreateStringHandle', [:dword, :string, :int], :hsz

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648749(v=vs.85).aspx
    # BOOL WINAPI DdeDisconnect( _In_  HCONV hConv )
    attach_function 'DdeDisconnect', [:hconv], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648750(v=vs.85).aspx
    # BOOL WINAPI DdeDisconnectList( _In_  HCONVLIST hConvList )
    attach_function 'DdeDisconnectList', [:pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648751(v=vs.85).aspx
    # BOOL WINAPI DdeEnableCallback(
    #   _In_  DWORD idInst,
    #   _In_  HCONV hConv,
    #   _In_  UINT wCmd )
    attach_function 'DdeEnableCallback', [:dword, :hconv, EnableCallback], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648752(v=vs.85).aspx
    # BOOL WINAPI DdeFreeDataHandle( _In_  HDDEDATA hData )
    attach_function 'DdeFreeDataHandle', [:hddedata], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648753(v=vs.85).aspx
    # BOOL WINAPI DdeFreeStringHandle(
    #   _In_  DWORD idInst,
    #   _In_  HSZ hsz )
    attach_function 'DdeFreeStringHandle', [:dword, :hsz], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648754(v=vs.85).aspx
    # DWORD WINAPI DdeGetData(
    #   _In_       HDDEDATA hData,
    #   _Out_opt_  LPBYTE pDst,
    #   _In_       DWORD cbMax,
    #   _In_       DWORD cbOff )
    attach_function 'DdeGetData', [:hddedata, :pointer, :dword, :dword], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648755(v=vs.85).aspx
    # UINT WINAPI DdeGetLastError( _In_  DWORD idInst )
    attach_function 'DdeGetLastError', [:dword], DdeManagementLibraryError

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648756(v=vs.85).aspx
    # BOOL WINAPI DdeImpersonateClient( _In_  HCONV hConv )
    attach_function 'DdeImpersonateClient', [:hconv], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648757(v=vs.85).aspx
    # UINT WINAPI DdeInitialize(
    #   _Inout_     LPDWORD pidInst,
    #   _In_        PFNCALLBACK pfnCallback,
    #   _In_        DWORD afCmd,
    #   _Reserved_  DWORD ulRes )
    encoded_function 'DdeInitialize', [:pointer, DdeCallback, :dword, :dword], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648758(v=vs.85).aspx
    # BOOL WINAPI DdeKeepStringHandle(
    #   _In_  DWORD idInst,
    #   _In_  HSZ hsz )
    attach_function 'DdeKeepStringHandle', [:dword, :hsz], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648759(v=vs.85).aspx
    # HDDEDATA WINAPI DdeNameService(
    #   _In_      DWORD idInst,
    #   _In_opt_  HSZ hsz1,
    #   _In_opt_  HSZ hsz2,
    #   _In_      UINT afCmd )
    attach_function 'DdeNameService', [:dword, :hsz, :hsz, DdeNameService], :hddedata

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648760(v=vs.85).aspx
    # BOOL WINAPI DdePostAdvise(
    #   _In_  DWORD idInst,
    #   _In_  HSZ hszTopic,
    #   _In_  HSZ hszItem )
    attach_function 'DdePostAdvise', [:dword, :hsz, :hsz], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648761(v=vs.85).aspx
    # UINT WINAPI DdeQueryConvInfo(
    #   _In_     HCONV hConv,
    #   _In_     DWORD idTransaction,
    #   _Inout_  PCONVINFO pConvInfo )
    attach_function 'DdeQueryConvInfo', [:hconv, :dword, CONVINFO], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648762(v=vs.85).aspx
    # HCONV WINAPI DdeQueryNextServer(
    #   _In_  HCONVLIST hConvList,
    #   _In_  HCONV hConvPrev )
    attach_function 'DdeQueryNextServer', [:pointer, :hconv], :hconv

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648763(v=vs.85).aspx
    # DWORD WINAPI DdeQueryString(
    #   _In_       DWORD idInst,
    #   _In_       HSZ hsz,
    #   _Out_opt_  LPTSTR psz,
    #   _In_       DWORD cchMax,
    #   _In_       int iCodePage )
    encoded_function 'DdeQueryString', [:dword, :hsz, :pointer, :dword, :int], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648764(v=vs.85).aspx
    # HCONV WINAPI DdeReconnect( _In_  HCONV hConv )
    attach_function 'DdeReconnect', [:hconv], :hconv

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649003(v=vs.85).aspx
    # BOOL WINAPI DdeSetQualityOfService(
    #   _In_   HWND hwndClient,
    #   _In_   const SECURITY_QUALITY_OF_SERVICE *pqosNew,
    #   _Out_  PSECURITY_QUALITY_OF_SERVICE pqosPrev )
    attach_function 'DdeSetQualityOfService', [:hwnd, :pointer, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648765(v=vs.85).aspx
    # BOOL WINAPI DdeSetUserHandle(
    #   _In_  HCONV hConv,
    #   _In_  DWORD id,
    #   _In_  DWORD_PTR hUser )
    attach_function 'DdeSetUserHandle', [:hconv, :dword, :dword], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648766(v=vs.85).aspx
    # BOOL WINAPI DdeUnaccessData( _In_  HDDEDATA hData )
    attach_function 'DdeUnaccessData', [:hddedata], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648767(v=vs.85).aspx
    # BOOL WINAPI DdeUninitialize( _In_  DWORD idInst )
    attach_function 'DdeUninitialize', [:dword], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649004(v=vs.85).aspx
    # BOOL WINAPI FreeDDElParam(
    #   _In_  UINT msg,
    #   _In_  LPARAM lParam )
    attach_function 'FreeDDElParam', [:uint, :lparam], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649005(v=vs.85).aspx
    # BOOL WINAPI ImpersonateDdeClientWindow(
    #   _In_  HWND hWndClient,
    #   _In_  HWND hWndServer )
    attach_function 'ImpersonateDdeClientWindow', [:hwnd, :hwnd], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649006(v=vs.85).aspx
    # LPARAM WINAPI PackDDElParam(
    #   _In_  UINT msg,
    #   _In_  UINT_PTR uiLo,
    #   _In_  UINT_PTR uiHi )
    attach_function 'PackDDElParam', [:uint, :ulong, :ulong], :lparam

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649007(v=vs.85).aspx
    # LPARAM WINAPI ReuseDDElParam(
    #   _In_  LPARAM lParam,
    #   _In_  UINT msgIn,
    #   _In_  UINT msgOut,
    #   _In_  UINT_PTR uiLo,
    #   _In_  UINT_PTR uiHi )
    attach_function 'ReuseDDElParam', [:lparam, :uint, :uint, :ulong, :ulong], :lparam

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649008(v=vs.85).aspx
    # BOOL WINAPI UnpackDDElParam(
    #   _In_   UINT msg,
    #   _In_   LPARAM lParam,
    #   _Out_  PUINT_PTR puiLo,
    #   _Out_  PUINT_PTR puiHi )
    attach_function 'UnpackDDElParam', [:uint, :lparam, :ulong, :ulong], :bool
  end
end