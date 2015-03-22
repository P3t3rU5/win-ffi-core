module WinFFI
  module User32
    #BOOL WINAPI DdeAbandonTransaction(
    #  _In_  DWORD idInst,
    #  _In_  HCONV hConv,
    #  _In_  DWORD idTransaction )
    attach_function 'DdeAbandonTransaction', [:dword, :hconv, :dword], :bool

    #LPBYTE WINAPI DdeAccessData(
    #  _In_       HDDEDATA hData,
    #  _Out_opt_  LPDWORD pcbDataSize )
    attach_function 'DdeAccessData', [:hddedata, :pointer], :pointer

    #HDDEDATA WINAPI DdeAddData(
    #  _In_  HDDEDATA hData,
    #  _In_  LPBYTE pSrc,
    #  _In_  DWORD cb,
    #  _In_  DWORD cbOff )
    attach_function 'DdeAddData', [:hddedata, :pointer, :dword, :dword], :pointer

    #TODO
    #HDDEDATA CALLBACK DdeCallback(
    #  _In_  UINT uType,
    #  _In_  UINT uFmt,
    #  _In_  HCONV hconv,
    #  _In_  HSZ hsz1,
    #  _In_  HSZ hsz2,
    #  _In_  HDDEDATA hdata,
    #  _In_  ULONG_PTR dwData1,
    #  _In_  ULONG_PTR dwData2 )

    #HDDEDATA WINAPI DdeClientTransaction(
    #  _In_opt_   LPBYTE pData,
    #  _In_       DWORD cbData,
    #  _In_       HCONV hConv,
    #  _In_opt_   HSZ hszItem,
    #  _In_       UINT wFmt,
    #  _In_       UINT wType,
    #  _In_       DWORD dwTimeout,
    #  _Out_opt_  LPDWORD pdwResult )
    attach_function 'DdeClientTransaction', [:pointer, :dword, :hconv, :hsz, :uint, :uint, :dword, :pointer], :hddedata

    #int WINAPI DdeCmpStringHandles(
    #  _In_  HSZ hsz1,
    #  _In_  HSZ hsz2 )
    attach_function 'DdeCmpStringHandles', [:hsz, :hsz], :int

    #HCONV WINAPI DdeConnect(
    #  _In_      DWORD idInst,
    #  _In_      HSZ hszService,
    #  _In_      HSZ hszTopic,
    #  _In_opt_  PCONVCONTEXT pCC )
    attach_function 'DdeConnect', [:dword, :hsz, :hsz, :pointer], :hconv

    #HCONVLIST WINAPI DdeConnectList(
    #  _In_      DWORD idInst,
    #  _In_      HSZ hszService,
    #  _In_      HSZ hszTopic,
    #  _In_      HCONVLIST hConvList,
    #  _In_opt_  PCONVCONTEXT pCC )
    attach_function 'DdeConnectList', [:dword, :hsz, :hsz, :pointer, :pointer], :pointer

    #HDDEDATA WINAPI DdeCreateDataHandle(
    #  _In_      DWORD idInst,
    #  _In_opt_  LPBYTE pSrc,
    #  _In_      DWORD cb,
    #  _In_      DWORD cbOff,
    #  _In_opt_  HSZ hszItem,
    #  _In_      UINT wFmt,
    #  _In_      UINT afCmd )
    attach_function 'DdeCreateDataHandle', [:dword, :pointer, :dword, :dword, :hsz, :uint, :uint], :hddedata

    #HSZ WINAPI DdeCreateStringHandle(
    #  _In_  DWORD idInst,
    #  _In_  LPTSTR psz,
    #  _In_  int iCodePage )
    attach_function 'DdeCreateStringHandleA', [:dword, :string, :int], :hsz
    attach_function 'DdeCreateStringHandleW', [:dword, :string, :int], :hsz

    #BOOL WINAPI DdeDisconnect( _In_  HCONV hConv )
    attach_function 'DdeDisconnect', [:hconv], :bool

    #BOOL WINAPI DdeDisconnectList( _In_  HCONVLIST hConvList )
    attach_function 'DdeDisconnectList', [:pointer], :bool

    #BOOL WINAPI DdeEnableCallback(
    #  _In_  DWORD idInst,
    #  _In_  HCONV hConv,
    #  _In_  UINT wCmd )
    attach_function 'DdeEnableCallback', [:dword, :hconv, :uint], :bool

    #BOOL WINAPI DdeFreeDataHandle( _In_  HDDEDATA hData )
    attach_function 'DdeFreeDataHandle', [:hddedata], :bool

    #BOOL WINAPI DdeFreeStringHandle(
    #  _In_  DWORD idInst,
    #  _In_  HSZ hsz )
    attach_function 'DdeFreeStringHandle', [:dword, :hsz], :bool

    #DWORD WINAPI DdeGetData(
    #  _In_       HDDEDATA hData,
    #  _Out_opt_  LPBYTE pDst,
    #  _In_       DWORD cbMax,
    #  _In_       DWORD cbOff )
    attach_function 'DdeGetData', [:hddedata, :pointer, :dword, :dword], :dword

    #UINT WINAPI DdeGetLastError( _In_  DWORD idInst )
    attach_function 'DdeGetLastError', [:dword], :uint

    #BOOL WINAPI DdeImpersonateClient( _In_  HCONV hConv )
    attach_function 'DdeImpersonateClient', [:hconv], :bool

    #UINT WINAPI DdeInitialize(
    #  _Inout_     LPDWORD pidInst,
    #  _In_        PFNCALLBACK pfnCallback,
    #  _In_        DWORD afCmd,
    #  _Reserved_  DWORD ulRes )
    attach_function 'DdeInitializeA', [:pointer, :pointer, :dword, :dword], :uint
    attach_function 'DdeInitializeW', [:pointer, :pointer, :dword, :dword], :uint

    #BOOL WINAPI DdeKeepStringHandle(
    #  _In_  DWORD idInst,
    #  _In_  HSZ hsz )
    attach_function 'DdeKeepStringHandle', [:dword, :hsz], :bool

    #HDDEDATA WINAPI DdeNameService(
    #  _In_      DWORD idInst,
    #  _In_opt_  HSZ hsz1,
    #  _In_opt_  HSZ hsz2,
    #  _In_      UINT afCmd )
    attach_function 'DdeNameService', [:dword, :hsz, :hsz, :uint], :hddedata

    #BOOL WINAPI DdePostAdvise(
    #  _In_  DWORD idInst,
    #  _In_  HSZ hszTopic,
    #  _In_  HSZ hszItem )
    attach_function 'DdePostAdvise', [:dword, :hsz, :hsz], :bool

    #UINT WINAPI DdeQueryConvInfo(
    #  _In_     HCONV hConv,
    #  _In_     DWORD idTransaction,
    #  _Inout_  PCONVINFO pConvInfo )
    attach_function 'DdeQueryConvInfo', [:hconv, :dword, :pointer], :uint

    #HCONV WINAPI DdeQueryNextServer(
    #  _In_  HCONVLIST hConvList,
    #  _In_  HCONV hConvPrev )
    attach_function 'DdeQueryNextServer', [:pointer, :hconv], :hconv

    #DWORD WINAPI DdeQueryString(
    #  _In_       DWORD idInst,
    #  _In_       HSZ hsz,
    #  _Out_opt_  LPTSTR psz,
    #  _In_       DWORD cchMax,
    #  _In_       int iCodePage )
    attach_function 'DdeQueryStringA', [:dword, :hsz, :pointer, :dword, :int], :dword
    attach_function 'DdeQueryStringW', [:dword, :hsz, :pointer, :dword, :int], :dword

    #HCONV WINAPI DdeReconnect( _In_  HCONV hConv )
    attach_function 'DdeReconnect', [:hconv], :hconv

    #BOOL WINAPI DdeSetQualityOfService(
    #  _In_   HWND hwndClient,
    #  _In_   const SECURITY_QUALITY_OF_SERVICE *pqosNew,
    #  _Out_  PSECURITY_QUALITY_OF_SERVICE pqosPrev )
    attach_function 'DdeSetQualityOfService', [:hwnd, :pointer, :pointer], :bool

    #BOOL WINAPI DdeSetUserHandle(
    #  _In_  HCONV hConv,
    #  _In_  DWORD id,
    #  _In_  DWORD_PTR hUser )
    attach_function 'DdeSetUserHandle', [:hconv, :dword, :dword], :bool

    #BOOL WINAPI DdeUnaccessData( _In_  HDDEDATA hData )
    attach_function 'DdeUnaccessData', [:hddedata], :bool

    #BOOL WINAPI DdeUninitialize( _In_  DWORD idInst )
    attach_function 'DdeUninitialize', [:dword], :bool

    #BOOL WINAPI FreeDDElParam(
    #  _In_  UINT msg,
    #  _In_  LPARAM lParam )
    attach_function 'FreeDDElParam', [:uint, :lparam], :bool

    #BOOL WINAPI ImpersonateDdeClientWindow(
    #  _In_  HWND hWndClient,
    #  _In_  HWND hWndServer )
    attach_function 'ImpersonateDdeClientWindow', [:hwnd, :hwnd], :bool

    #LPARAM WINAPI PackDDElParam(
    #  _In_  UINT msg,
    #  _In_  UINT_PTR uiLo,
    #  _In_  UINT_PTR uiHi )
    attach_function 'PackDDElParam', [:uint, :ulong, :ulong], :lparam

    #LPARAM WINAPI ReuseDDElParam(
    #  _In_  LPARAM lParam,
    #  _In_  UINT msgIn,
    #  _In_  UINT msgOut,
    #  _In_  UINT_PTR uiLo,
    #  _In_  UINT_PTR uiHi )
    attach_function 'ReuseDDElParam', [:lparam, :uint, :uint, :ulong, :ulong], :lparam

    #BOOL WINAPI UnpackDDElParam(
    #  _In_   UINT msg,
    #  _In_   LPARAM lParam,
    #  _Out_  PUINT_PTR puiLo,
    #  _Out_  PUINT_PTR puiHi )
    attach_function 'UnpackDDElParam', [:uint, :lparam, :ulong, :ulong], :bool

  end
end