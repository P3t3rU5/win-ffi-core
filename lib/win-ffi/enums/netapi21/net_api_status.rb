require 'win-ffi/enums/netapi32'

module WinFFI
  module Netapi32
    NetApiStatus = enum :net_api_status,
    [
      :NERR_Success, 0,
      :NERR_InvalidComputer, 2351,
      :NERR_NotPrimary, 2226,
      :NERR_SpeGroupOp, 2234,
      :NERR_LastAdmin, 2452,
      :NERR_BadPassword, 2203,
      :NERR_PasswordTooShort, 2245,
      :NERR_UserNotFound, 2221,
      :ERROR_ACCESS_DENIED, 5,
      :ERROR_NOT_ENOUGH_MEMORY, 8,
      :ERROR_INVALID_PARAMETER, 87,
      :ERROR_INVALID_NAME, 123,
      :ERROR_INVALID_LEVEL, 124,
      :ERROR_SESSION_CREDENTIAL_CONFLICT, 1219,
      :RPC_S_SERVER_UNAVAILABLE, 2147944122,
      :RPC_E_REMOTE_DISABLED, 2147549468,
    ]
  end
end