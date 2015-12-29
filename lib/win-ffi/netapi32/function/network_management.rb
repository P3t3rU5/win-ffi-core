require 'win-ffi/netapi32'

module WinFFI
  module Netapi32

    # NET_API_STATUS NetWkstaGetInfo(
    #   _In_  LPWSTR servername,
    #   _In_  DWORD  level,
    #   _Out_ LPBYTE *bufptr);
    attach_function :NetWkstaGetInfo, [:string, :dword, :pointer], :dword

  end
end