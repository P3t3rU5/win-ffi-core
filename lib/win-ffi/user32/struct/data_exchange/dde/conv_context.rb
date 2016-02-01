module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648730(v=vs.85).aspx
    # The following structure is used by DdeConnect() and DdeConnectList() and by XTYP_CONNECT and XTYP_WILDCONNECT
    # callbacks.
    # TODO SECURITY_QUALITY_OF_SERVICE struct
    class CONVCONTEXT < FFIStruct
      layout :cb,         :uint, # set to sizeof(CONVCONTEXT) */,
             :wFlags,     :uint, # none currently defined. */,
             :wCountryID, :uint, # country/region code for topic/item strings used. */,
             :iCodePage,  :int, # codepage used for topic/item strings. */,
             :dwLangID,   :dword, # language ID for topic/item strings. */,
             :dwSecurity, :dword, # Private security code. */,
             :qos,        :pointer # client side's quality of service */
    end
  end
end