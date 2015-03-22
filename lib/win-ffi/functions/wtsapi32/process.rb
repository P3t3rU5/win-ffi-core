module WinFFI
  module Wtsapi32
    #BOOL WTSEnumerateProcesses(
    #  _In_   HANDLE hServer,
    #  _In_   DWORD Reserved,
    #  _In_   DWORD Version,
    #  _Out_  PWTS_PROCESS_INFO *ppProcessInfo,
    #  _Out_  DWORD *pCount )
    attach_function 'WTSEnumerateProcessesA', [:handle, :dword, :dword, :pointer, :pointer], :bool
    attach_function 'WTSEnumerateProcessesW', [:handle, :dword, :dword, :pointer, :pointer], :bool
  end
end