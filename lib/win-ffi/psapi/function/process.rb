module WinFFI
  module Psapi
    ffi_lib 'Psapi'

    begin
      # psapi, maybe
      # BOOL WINAPI EnumProcesses(
      #   _Out_  DWORD *pProcessIds,
      #   _In_   DWORD cb,
      #   _Out_  DWORD *pBytesReturned )
      attach_function 'EnumProcesses', [:pointer, :dword, :pointer], :bool
    rescue FFI::FunctionNotFound

    end
  end
end