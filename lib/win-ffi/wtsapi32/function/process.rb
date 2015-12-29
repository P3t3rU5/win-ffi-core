require 'win-ffi/wtsapi32'

module WinFFI
  module Wtsapi32
    #BOOL WTSEnumerateProcesses(
    #  _In_   HANDLE hServer,
    #  _In_   DWORD Reserved,
    #  _In_   DWORD Version,
    #  _Out_  PWTS_PROCESS_INFO *ppProcessInfo,
    #  _Out_  DWORD *pCount )
    encoded_function 'WTSEnumerateProcesses', [:handle, :dword, :dword, :pointer, :pointer], :bool
  end
end